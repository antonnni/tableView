//
//  TableViewController.swift
//  cartoonTableView
//
//  Created by Anton Ni on 31/10/23.
//

import UIKit

class TableViewController: UITableViewController {

    var arrayMovies = [
    Movie(name: "История игрушек", year: "1995", director: "Джон Лассетер", like: "Этот фильм понравился 87 % пользователей", imagename: "toy_story", description: "Каждый ребенок верит, что когда он оставляет свои игрушки одни, они начинают заниматься своими делами. Этот мультипликационный фильм позволяет убедиться им в своей правоте.") ,
    Movie(name: "ВАЛЛ-И", year: "2008", director: "Эндрю Стэнтон", like: "Этот фильм понравился 92 % пользователей", imagename: "wall-e", description: "Робот ВАЛЛ·И из года в год прилежно трудится на опустевшей Земле, очищая нашу планету от гор мусора, которые оставили после себя улетевшие в космос люди. Он и не представляет, что совсем скоро произойдут невероятные события, благодаря которым он встретит друзей, поднимется к звездам и даже сумеет изменить к лучшему своих бывших хозяев, совсем позабывших родную Землю."),
    Movie(name: "Академия монстров", year: "2020", director: "Леопольдо Агилар", like: "Этот фильм понравился 47 % пользователей", imagename: "academy", description: "Школьнику Дэнни живется несладко: он не может подружиться с одноклассниками и не находит общего языка с преподавателями. И всему виной его гениальность. Но однажды он попадает в школу для одаренных детей, где случайно открывает портал в мир... монстров."),
    Movie(name: "Зверополис", year: "2016", director: "Рич Мур, Байрон Ховард", like: "Этот фильм понравился 88 % пользователей", imagename: "zootopia", description: "Добро пожаловать в Зверополис — современный город, населенный самыми разными животными, от огромных слонов до крошечных мышек. Зверополис разделен на районы, полностью повторяющие естественную среду обитания разных жителей — здесь есть и элитный район Площадь Сахары и неприветливый Тундратаун. В этом городе появляется новый офицер полиции, жизнерадостная зайчиха Джуди Хоппс, которая с первых дней работы понимает, как сложно быть маленькой и пушистой среди больших и сильных полицейских. Джуди хватается за первую же возможность проявить себя, несмотря на то, что ее партнером будет болтливый хитрый лис Ник Уайлд. Вдвоем им предстоит раскрыть сложное дело, от которого будет зависеть судьба всех обитателей Зверополиса."),
    Movie(name: "Душа", year: "2020", director: "Пит Доктер", like: "Этот фильм понравился 87 % пользователей", imagename: "soul", description: "Школьный учитель музыки Джо Гарднер случайно попадает в мир, где зарождаются человеческие увлечения, мечты и интересы, и там он знакомится с молодой душой по имени 22.")]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayMovies.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 189
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)

        // Configure the cell...

        let label = cell.viewWithTag(1000) as! UILabel
        label.text = arrayMovies[indexPath.row].name
        
        let labelYear = cell.viewWithTag(1001) as! UILabel
        labelYear.text = arrayMovies[indexPath.row].year

        let labelLike = cell.viewWithTag(1002) as! UILabel
        labelLike.text = arrayMovies[indexPath.row].like
        
        let imageview = cell.viewWithTag(1003) as! UIImageView
        imageview.image = UIImage(named: arrayMovies[indexPath.row].imagename)
        
        return cell
    }
    
    @IBAction func addMovie(_ sender: Any) {
        arrayMovies.append(Movie(name: "Название мультфильма", year:"1900" , director: "имя режиссера", like: "процент пользователей, кому понравился мультик", imagename: "newMovie", description: "Краткое описание мультфильма"))
        
        tableView.reloadData()
    }
    
    //переход в новый сториборд с детальным описание мультфильма
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! ViewController
        
        detailVc.movie = arrayMovies[indexPath.row]
        
        navigationController?.show(detailVc, sender: self)
    }
         

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            
            
            arrayMovies.remove(at: indexPath.row).self
            
            
            
//            arrayMovies.remove(at: indexPath.row).name
//            arrayMovies.remove(at: indexPath.row).like
//            arrayMovies.remove(at: indexPath.row).year
//
//            arrayMovies.remove(at: indexPath.row).imagename
//            arrayMovies.remove(at: indexPath.row).description
//            arrayMovies.remove(at: indexPath.row).director
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
