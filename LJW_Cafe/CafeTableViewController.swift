//
//  CafeTableViewController.swift
//  CafeListView
//
//  Created by SWUCOMPUTER on 2018. 5. 2..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class CafeTableViewController: UITableViewController {
    
    
    var swucafe:[String : [String : Int]] =
        ["가은" : ["아메리카노" : 2000 , "카페라떼": 2500, "바닐라라떼": 3000, "카라멜마끼아또": 3500, "카페모카": 3200, "화이트모카": 3200,
                "연유라떼": 3500, "더치커피": 7000, "녹차라떼": 2300,"홍차라떼": 2300,"고구마라떼": 2300,"초코라떼": 3000, "민트초코라떼": 3200, "화이트초코민트라떼": 3200,"오곡라떼": 2800, "아이스티": 1900, "핑크레몬에이드": 2200,"플레인스무디": 3300, "과일스무디(블루베리, 유자, 망고, 딸기)": 4000,"허브티": 2000,"유자차": 2300,"레몬차": 2300, "자몽차": 2300, "젤라또":2000 ],
         
         "드림" : ["아메리카노" : 2100, "헤이즐넛": 2400, "카페라떼" : 3100,"바닐라 라떼" : 3300, "헤이즐넛 라떼" : 3300, "카라멜 라떼" : 3300,
                     "카라멜 마끼아또" : 2100, "바닐라 마끼아또" : 3400, "카페모카" : 3800, "화이트 모카" : 3800, "카라멜 모카" : 3800,
                     "카페 민트 모카" : 3800, "유자차" : 2800, "녹차라떼" : 3300, "홍차라떼" : 3300, "고구마라떼" : 3300, "스위트 바닐라" : 3300, "초코라떼" : 3800, "민트초코" : 3800, "티라미수라뗴" : 3800, "바나나라뗴" : 3000,"아이스티" : 3300],
         
         "팬도로시" : ["아메리카노":1800, "카페라떼":2700, "달달 아메리카노":2100,"카페라떼(바닐라/카라멜/헤이즐넛)":2800, "카페라떼(다크/자바칩/민트초코)":3000, "달달 카페라떼":3000, "(순)바닐라 카페라떼":3100, "카페모카":3300, "카라멜 카페모카":3500, "카페모카(다크/자바칩/민트)":3500, "카라멜 마끼아또":3300, "카푸치노":2700, "초콜릿":2800, "다크/자바칩/민트 초코":3000, "그린티라떼":3100, "자색고구마라떼":3100, "(순)바닐라":3300, "곡물 라떼":3300, "쿠키앤크림라떼":3300, "과일라떼(망고/딸기/피나콜라다/핑크구아바)":3300,"(수)에이드(자몽/레몬/유자)":2500, "청포도/자몽 에이드":2800,"딸기/딸기피나콜라다/핑크구아바/망고에이드":2800, "복숭아 아이스티":2000, "(순)바닐라 프라페":3800, "쿠키앤크림 프라페":3800, "초코/다크/민트/자바칩 프라페":3800, "곡물 프라페":3800, "자색고구마 프라페":3800, "블랙 버블티":3500, "버블티(곡물/쿠키앤크림/자색고구마)":3500, "고르곤졸라/고구마/체다치즈/하와이안 피자":10500, "토마토 치즈/크림 파스타":4300],
         
         "비틀주스" : ["바나나 생과일 주스":2700, "딸기(딸기/딸바/딸키/딸파)생과일 주스" : 3700, "딸기(딸기/딸바/딸키/딸파)생과일 주스" : 3700]]
    
   /* var totalCount: [Int] = [0,0,0]
    var currentSection = 0; */

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.title="SWU CAFE"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return swucafe.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cafe Cell", for: indexPath)

        // Configure the cell...
        
        
        var cafeName = Array(swucafe.keys)
        cell.textLabel?.text = cafeName[indexPath.row]
        //let numCount = Array(menuInfo.values) [indexPath.row]
     
       

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
//        if segue.identifier == "toMenuView" {
//            if let destination = segue.destination as? MenuTableViewController {
//                if let selectedIndex = self.tableView.indexPathsForSelectedRows?.first?.row {
//                    print(selectedIndex)
//                    destination.title = Array(swucafe.keys) [selectedIndex]
//                    destination.menuList = Array(swucafe.values) [selectedIndex]
//                }
//            }
//        }
        
        if segue.identifier == "toMenuView" {
            if let tabVC:UITabBarController = segue.destination as? UITabBarController {
                if let menuVC:MenuTableViewController = tabVC.viewControllers?.first as? MenuTableViewController {
                    let selectedIndex = self.tableView.indexPathForSelectedRow?.row
                    menuVC.viewtitle = Array(swucafe.keys)[selectedIndex!]
                    menuVC.menuList = Array(swucafe.values)[selectedIndex!]
                }
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
