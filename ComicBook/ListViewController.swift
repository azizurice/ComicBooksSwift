//
//  FirstViewController.swift
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-22.
//  Copyright © 2016 letscodes. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
   
    
var apps = TIBApps.getAllApps()
let detailSegueIdentifier="ShowDetailSegue"
    var passCharacter = ComicCharacter(title: "Headsup ", detail: "Beginner Detail", imageName: "1")

override func viewDidLoad() {
    super.viewDidLoad()
    setUIEnabled(enabled: false)
    getCharactersFromMarvel()
    
    tableView.dataSource = self
    tableView.estimatedRowHeight = 165
    tableView.rowHeight = UITableViewAutomaticDimension

}
private func setUIEnabled(enabled: Bool){
    
        
}
    private func getCharactersFromMarvel(){
        
       let methodParameters = [Constants.MarvelParameterKeys.TS :Constants.MarvelParameterValues.ts,
                               Constants.MarvelParameterKeys.APIKey : Constants.MarvelParameterValues.APIKey,
                               Constants.MarvelParameterKeys.HASH:getHash()]
    
        let urlString = Constants.Marvel.APIBaseURL + escapedParameters(parameters: methodParameters as [String : AnyObject])
        print("The MARVEL url is : \(urlString)")
        
        let urlTempString = "http://gateway.marvel.com/v1/public/comics?ts=17&apikey=c30573ac063f8a33b1de98dffc550caf&hash=7f2feb587bc9e1e5353669b50619baaf&limit=16"
        let url=URL(string: urlTempString)!
        let request = URLRequest(url : url)
        print (" Come up to here ")
        let task = URLSession.shared.dataTask(with: request){(data,response, error) in
            //  print (" Come up to here ")
       // if an error occurs, print it
            func displayError(error: String){
                print(error)
                print("URL at time of error : \(url)")
                self.setUIEnabled(enabled: true)
                
            }
        if error == nil{
            if let data = data {
                let parsedResult :[String :AnyObject]!
                do{
                    parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
                } catch {
                
                    displayError(error: "Could not parse the data JSON '\(data)'")
                    return
                }
                 // print (parsedResult)
               
                
                if let jasonData = parsedResult[Constants.MarvelResponseKeys.Data] as? [String:AnyObject],
                    
                     let resultsArray = jasonData[Constants.MarvelResponseKeys.Results] as?[[String:AnyObject]]{
                    
                     print(" First Item ")
                     print(resultsArray[0])
                    
//                    for comicBook in resultsArray {
//                        print(comicBook)
////                        let title = comicBook[Constants.MarvelResponseKeys.Title] as! String
////                        let description = comicBook[Constants.MarvelResponseKeys.Description] as? String
////                        let jsonThumbnail = comicBook[Constants.MarvelResponseKeys.Thumbnail] as! [String:AnyObject]
////                        let thumbnailPath = jsonThumbnail[Constants.MarvelResponseKeys.Path] as? String
////                        let thumbnailExtension = jsonThumbnail[Constants.MarvelResponseKeys.Extension] as? String
////                        let characterURL = thumbnailPath! + "/portrait_large."  + thumbnailExtension! as String
//                        
//                       // Character(title: title, detail: description, characterURL: characterURL)
//                      //  DataSource.characters.append(Character(title: title, detail: description!, characterURL: characterURL))
//                    }
                    
                    
               //  print(jasonData)
                }
             
                for c in DataSource.characters {
                    print(c.title! + " " + c.detail! + " " + c.characterURL!)
                }
                
            }
            
            
          
        }
    }
            task.resume()
        
}
    
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
        return apps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! AppTableViewCell
        
        let app = apps[indexPath.row]
        
        cell.app = app
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             let indexPath = tableView.indexPathForSelectedRow
        print("The width of someResolution is 1 \(passCharacter.detail)")
          passCharacter = apps[(indexPath?.row)!]
        print("The width of someResolution is 2 \(passCharacter.detail)")
            
            performSegue(withIdentifier:"ShowDetailSegue", sender: self)
          //  let selectedCharacter = self.apps[indexPath.row]
         //   let detailVC = DetailViewController
    
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        // Get the index path from the cell that was tapped
        let indexPath = tableView.indexPathForSelectedRow
        // Get the Row of the Index Path and set as index
        //let index = indexPath?.row
        let app = apps[(indexPath?.row)!]
        if (segue.identifier == detailSegueIdentifier) {
            print("The width of someResolution is \(app.detail)")
        //    let nav=segue.destination as! UINavigationController
            // Get in touch with the DetailViewController
            let detailViewController = segue.destination as! DetailViewController
            // Pass on the data to the Detail ViewController by setting it's indexPathRow value
      
            detailViewController.app = app
        }
        
        
    }
    
}


