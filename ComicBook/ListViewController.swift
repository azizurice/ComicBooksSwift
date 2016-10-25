//
//  FirstViewController.swift
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-22.
//  Copyright © 2016 letscodes. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD


class ListViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
   
    @IBOutlet weak var contentView: UIView!
   
    
    


let detailSegueIdentifier="ShowDetailSegue"
 

override func viewDidLoad() {
    super.viewDidLoad()
    setUIEnabled(enabled: true)
    //getCharactersFromMarvel()
    getCharactersUsingAlamofire();
    
    navigationItem.title = "Comic Book"
    tableView.dataSource = self
    tableView.estimatedRowHeight = 165
    tableView.rowHeight = UITableViewAutomaticDimension

}
private func setUIEnabled(enabled: Bool){
    
    tableView.isHidden = enabled
    contentView.isHidden = !enabled
    
        
}
    private func getCharactersUsingAlamofire(){
        showLoadingHUD();
         let urlTempString = "http://gateway.marvel.com/v1/public/comics?ts=17&apikey=c30573ac063f8a33b1de98dffc550caf&hash=7f2feb587bc9e1e5353669b50619baaf&limit=11"
        let url=URL(string: urlTempString)
        Alamofire.request(url!).responseJSON { response in
            
//            guard  let strongSelf = self else{
//                return
//            }
            
            if let JSON = response.result.value {
                //print("JSON: \(JSON)")
              self.retrieveFromJSON(jsonObject: JSON as! NSDictionary)
              }
            self.hideLoadingHUD()
        }
    
    }
    
    func retrieveFromJSON(jsonObject : NSDictionary){
        let jsonData = jsonObject[Constants.MarvelResponseKeys.Data] as! NSDictionary
        let resultsArray = jsonData[Constants.MarvelResponseKeys.Results] as! NSArray
        
        for index in 0..<resultsArray.count{
            let comicBook = resultsArray[index] as! NSDictionary
            
            let title = comicBook[Constants.MarvelResponseKeys.Title] as! String
            var description = comicBook[Constants.MarvelResponseKeys.Description] as? String
            
            if (self.isObjectNil(object: description as AnyObject!)){
                description = "No details available"
            }
            let jsonThumbnail = comicBook[Constants.MarvelResponseKeys.Thumbnail] as! [String:AnyObject]
            let thumbnailPath = jsonThumbnail[Constants.MarvelResponseKeys.Path] as? String
            let thumbnailExtension = jsonThumbnail[Constants.MarvelResponseKeys.Extension] as? String
            let characterURL = thumbnailPath! + "/portrait_large."  + thumbnailExtension! as String
            
            let cc = Character(title: title, detail: description, characterURL: characterURL)
            DataSource.characters.append(cc)
            
        }
    }
    
 
    
    func isObjectNil(object: AnyObject!)->Bool{
            if let _:AnyObject = object{
                return false
            }
            return true
        }
    
    
    fileprivate func showLoadingHUD(){
        let hud = MBProgressHUD.showAdded(to: contentView, animated: true)
         hud.labelText = "Loading..."
    }
    
  
    
     fileprivate func hideLoadingHUD() {
        
        MBProgressHUD.hide(for: contentView, animated: true)
        self.setUIEnabled(enabled: false)
        self.tableView.reloadData()
        
        
       
    }
    
    

//  Without using AnyLibray
    
//    private func getCharactersFromMarvel(){
//           showLoadingHUD();
//        
//       let methodParameters = [Constants.MarvelParameterKeys.TS :Constants.MarvelParameterValues.ts,
//                               Constants.MarvelParameterKeys.APIKey : Constants.MarvelParameterValues.APIKey,
//                               Constants.MarvelParameterKeys.HASH:getHash()]
//    
//        let urlString = Constants.Marvel.APIBaseURL + escapedParameters(parameters: methodParameters as [String : AnyObject])
//        print("The MARVEL url is : \(urlString)")
//        
//        let urlTempString = "http://gateway.marvel.com/v1/public/comics?ts=17&apikey=c30573ac063f8a33b1de98dffc550caf&hash=7f2feb587bc9e1e5353669b50619baaf&limit=5"
//        let url=URL(string: urlTempString)!
//        let request = URLRequest(url : url)
//    
//        let task = URLSession.shared.dataTask(with: request){(data,response, error) in
//    
//       // if an error occurs, print it
//            func displayError(error: String){
//                print(error)
//                print("URL at time of error : \(url)")
//                self.setUIEnabled(enabled: true)
//                
//            }
//        if error == nil{
//            if let data = data {
//                let parsedResult :NSDictionary!
//                do{
//                    parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! NSDictionary
//                } catch {
//                
//                    displayError(error: "Could not parse the data JSON '\(data)'")
//                    return
//                }
//                 // print (parsedResult)
//               
//                self.retrieveFromJSON(jsonObject: parsedResult)
//                
//                }
//            
//             self.hideLoadingHUD()
//          
//        }
//    }
//            task.resume()
//        
//}
    
    private func getHash()->String{
        // We can dynamically genereate hask value using 3rd party libary here
        
        //return "\(Constants.MarvelParameterValues.ts)\(Constants.MarvelParameterValues.PRIVATE_KEY)\(Constants.MarvelParameterValues.PUBLIC_KEY)".md5()
        
        // here I am using the already geneated hash key by one line tool : http://www.md5hashgenerator.com . There are many available.
        return Constants.MarvelParameterValues.Hash;
        
    
    }


private func escapedParameters(parameters: [String:AnyObject])->String{
        if parameters.isEmpty{
            return ""
        } else {
            var keyValuePairs = [String]()
            for (key,value) in parameters{
                let stringValue = "\(value)"
                let escapeValue = stringValue.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                keyValuePairs.append(key + "=" + "\(escapeValue!)")
                
            }
            return "?\(keyValuePairs.joined(separator:"&"))"
        }
    }
}

extension ListViewController : UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       
        return DataSource.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! AppTableViewCell
        
      let comicDetails = DataSource.characters[indexPath.row]
        
        cell.app = comicDetails
        
        return cell
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        // Get the index path from the cell that was tapped
        let indexPath = tableView.indexPathForSelectedRow
        let app = DataSource.characters[(indexPath?.row)!]
        
        if (segue.identifier == detailSegueIdentifier) {
            // Get in touch with the DetailViewController
            let detailViewController = segue.destination as! DetailViewController
          
            detailViewController.app = app
        }
        
        
    }
    
}


