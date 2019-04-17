




import UIKit

class SecTableViewController: UITableViewController {

    var infArr = [info]()

    override func viewDidLoad() {
        super.viewDidLoad()

        putData()

        print("PutData")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    func putData()
    {

        // URL

        let url = URL(string: "https://fmtest.dishco.com/shawmanservices/api/TOTickerItem/FunPubGeTickerItems?IntLocRestaurantId=642332&StrLocSourceApp=WLA&StrLocPackageName=ticker.shawman.com.smaaash")

        // Request

        var request = URLRequest(url: url!)

        // Method

        request.httpMethod = "POST"

        //Headers

//                var headers: HTTPHeaders = [
//                    "Content-Type": "application/json",
//                    "iOSPhone":"EV6FTlgBhOZ6tJhZhz9nfpmeC38PtzRokjjkCwhsKjU="
//                ]
        request.allHTTPHeaderFields = ["Content-Type":"application/json","iOSPhone":"EV6FTlgBhOZ6tJhZhz9nfpmeC38PtzRokjjkCwhsKjU="]
        // Post Body (parameter)

//        let postString = "category_id=24"
//
//        request.httpBody = postString.data(using: .utf8)


        // Session

        let session = URLSession.shared

        // Task

        let Task = session.dataTask(with: request, completionHandler: {
             (data:Data?,response:URLResponse?, error:Error?) -> Void in


           // check for fundamental networking error

            if error != nil
            {
                    var alert = UIAlertController(title: "Error!", message: "Error Occured While Parsing", preferredStyle: .alert)

                    self.present(alert, animated: true, completion: nil)
            }

            // check for http errors

            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }

            let responseString = String(data: data!, encoding: .utf8)

            print("responseString = \(String(describing: responseString))")

           // let rooDict = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments)

            let rootDict = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary

            let allData = rootDict.object(forKey: "Status") as! String
           // let data = rootDict.object(forKey: "Data")as! String?
            let stcode = rootDict.object(forKey: "StatusCode")as! Int
let stcod = rootDict.object(forKey: "StatusCode")as! Int
//            for dataIn in allData
//            {
//                let Info = info()
//
//                let DATA = dataIn as! NSDictionary
//
//                print(DATA)
//
//                let Name = DATA.object(forKey: "video_title") as! String
//                Info.name = Name
//
//                let imgURL = DATA.object(forKey: "video_image_url") as! String
//                Info.imgUrl = imgURL
//
//                let img = try! Data.init(contentsOf : URL(string: Info.imgUrl!)!)
//
//                Info.img = UIImage(data: img)
//
//
//
//                self.infArr.append(Info)
//
//              //  let imgData = try! Data.init(contentsOf: URL(string: SchoolObj.sicon)!)
//
//               // SchoolObj.simage = UIImage(data: imgData)
//
//            }
            self.tableView.reloadData()
            print(rootDict)




            })
        Task.resume()

    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return infArr.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let Temp = infArr[indexPath.row]

        cell.imageView?.image = Temp.img
        cell.textLabel?.text = Temp.name



        return cell
    }


    

}

//

// var request = URLRequest(url: URL(string: "http://callidustech360.com/astrovani/ws-get-video-list")!)
// let postString = "category_id=24"




//import UIKit
//
//class SecTableViewController: UITableViewController {
//
//    var infArr = [info]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        putData()
//
//        print("PutData")
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
//    }
//    func putData()
//    {
//        
//        // URL
//
//        let url = URL(string: "https://fmtest.dishco.com/shawmanservices/api/TOTickerItem/FunPubGeTickerItems?IntLocRestaurantId=642332&StrLocSourceApp=WLA&StrLocPackageName=ticker.shawman.com.smaaash")
//
//        // Request
//
//        var request = URLRequest(url: url!)
//
//        // Method
//
//        request.httpMethod = "POST"
//
//        //Headers
//
////                var headers: HTTPHeaders = [
////                    "Content-Type": "application/json",
////                    "iOSPhone":"EV6FTlgBhOZ6tJhZhz9nfpmeC38PtzRokjjkCwhsKjU="
////                ]
//        request.allHTTPHeaderFields = ["Content-Type":"application/json","iOSPhone":"EV6FTlgBhOZ6tJhZhz9nfpmeC38PtzRokjjkCwhsKjU="]
//        // Post Body (parameter)
//
////        let postString = "category_id=24"
////
////        request.httpBody = postString.data(using: .utf8)
//
//
//        // Session
//
//        let session = URLSession.shared
//
//        // Task
//
//        let Task = session.dataTask(with: request, completionHandler: {
//             (data:Data?,response:URLResponse?, error:Error?) -> Void in
//
//
//           // check for fundamental networking error
//
//            if error != nil
//            {
//                    var alert = UIAlertController(title: "Error!", message: "Error Occured While Parsing", preferredStyle: .alert)
//
//                    self.present(alert, animated: true, completion: nil)
//            }
//
//            // check for http errors
//
//            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
//                print("statusCode should be 200, but is \(httpStatus.statusCode)")
//                print("response = \(String(describing: response))")
//            }
//
//            let responseString = String(data: data!, encoding: .utf8)
//
//            print("responseString = \(String(describing: responseString))")
//
//           // let rooDict = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments)
//
//            let rootDict = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
//
//            let allData = rootDict.object(forKey: "data") as! NSArray
//
//            for dataIn in allData
//            {
//                let Info = info()
//
//                let DATA = dataIn as! NSDictionary
//
//                print(DATA)
//
//                let Name = DATA.object(forKey: "video_title") as! String
//                Info.name = Name
//
//                let imgURL = DATA.object(forKey: "video_image_url") as! String
//                Info.imgUrl = imgURL
//
//                let img = try! Data.init(contentsOf : URL(string: Info.imgUrl!)!)
//
//                Info.img = UIImage(data: img)
//
//
//
//                self.infArr.append(Info)
//
//              //  let imgData = try! Data.init(contentsOf: URL(string: SchoolObj.sicon)!)
//
//               // SchoolObj.simage = UIImage(data: imgData)
//
//            }
//            self.tableView.reloadData()
//            print(rootDict)
//
//
//
//
//            })
//        Task.resume()
//
//    }
//
//
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return infArr.count
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        let Temp = infArr[indexPath.row]
//
//        cell.imageView?.image = Temp.img
//        cell.textLabel?.text = Temp.name
//
//
//
//        return cell
//    }
//
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
