import Foundation
import Swift
import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

extension UIViewController{
    
    
    func compare(array1: [String], array2: [String]) -> Int{
        var count = 0
        for x in array1{
            var i = 0
            while i<3{
                if x == array2[i]{
                    count += 1
                }
                i += 1
            }
        }
        return count
    }
    
    
    func big(arr:String, dic:[String: [String]]) -> Array<String>{
        var scores: [String: Int] = [:]
        
        for x in dic.keys{
            if x != arr{
                scores[x] = compare(array1: dic[arr]!, array2: dic[x]!)
            }
        }
        let userIDs = [String](scores.keys)
        let matchCount = [Int](scores.values)
        var numArray:[(count: Int, ID: String)] = []
        for (ID, count) in zip(userIDs, matchCount) {
            numArray.append((count: count, ID: ID))
        }
        numArray.sort(by: >)
        print(numArray)
        /*
         var largest = 0
         var a: String = ""
         for x in scores.keys {
         if scores[x]! > largest {
         largest = scores[x]!
         a = x
         }
         }
         */
        var arrayOfUsers: Array<String> = []
        for x in 0...2{
            arrayOfUsers.append(numArray[x].1)
        }
        return arrayOfUsers
        // print("You have a match: '\(a)' !")
        // for (array, score) in scores{
        //    print("The similarity between '\(array1)' and '\(array)' is '\(score)'")
        // }
    }
    
    func findFirstName(uid: String, completion: @escaping (String) -> Void){
        let db = Firestore.firestore()
        var fN = ""
         db.collection("users").document(uid).getDocument { (document, error) in
             if error == nil{
                 //Check the document exists
                 if document != nil && document!.exists == true{
                     let documentData = document!.data()
                     let firstName = documentData?["firstname"] as! String
                     fN = firstName
                    completion(fN)
                 }
                 else{
                     print("error")
                 }
             }
       
         }
      
    }
    func findLastName(uid: String, completion: @escaping (String) -> Void){
        let db = Firestore.firestore()
        var lN = ""
         db.collection("users").document(uid).getDocument { (document, error) in
             if error == nil{
                 //Check the document exists
                 if document != nil && document!.exists == true{
                     let documentData = document!.data()
                     let lastName = documentData?["lastname"] as! String
                     lN = lastName
                    completion(lN)
                 }
                 else{
                     print("error")
                 }
             }
       
         }
      
    }
    
    func findPreferences(uid: String, completion: @escaping (Array<String>) -> Void){
        let db = Firestore.firestore()
        var preferences: Array<String> = []
         db.collection("users").document(uid).getDocument { (document, error) in
             if error == nil{
                 //Check the document exists
                 if document != nil && document!.exists == true{
                     let documentData = document!.data()
                     let preference = documentData?["preferences"] as! Array<String>
                     preferences = preference
                    completion(preferences)
                 }
                 else{
                     print("error")
                 }
             }
       
         }
      
    }
    
    func findMatches(uid: String, completion: @escaping (Array<String>) -> Void){
        let db = Firestore.firestore()
        var matches: Array<String> = []
         db.collection("users").document(uid).getDocument { (document, error) in
             if error == nil{
                 //Check the document exists
                 if document != nil && document!.exists == true{
                     let documentData = document!.data()
                     let match = documentData?["matches"] as! Array<String>
                     matches =  match
                    completion(matches)
                 }
                 else{
                     print("error")
                 }
             }
       
         }
      
    }
}
