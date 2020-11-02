//
//  ViewController.swift
//  PokeDex2020
//
//  Created by Field Employee on 10/31/20.
//
import SDWebImage
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var pokemonArray = [Pokemon]()
    private var imageArray = [UIImage]()
    private var loading = true
    private var pokemonCount = 151
    
    var moves: [String]?
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let nib = UINib(nibName: "PokemonCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "PokemonCell")
        tableView.delegate = self
        tableView.dataSource = self

        for i in stride(from: 1, to: pokemonCount + 1, by: 1) {
            getPokemon(withID: i)
        }
        
        
    }
    
    

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if loading {
            return 1
        } else {
            pokemonArray.sort { $0.id < $1.id }
            return pokemonArray.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        
        if loading {
            cell.nameLabel?.text = "Loading..."
        } else {
            let poke = pokemonArray[indexPath.row]
            cell.nameLabel?.text = poke.name
            cell.detailLabel?.text = poke.typeArray.compactMap({$0.element.elementName}).joined(separator: ", ")
            cell.indexLabel?.text = String(poke.id)
            cell.pokemonImageView.sd_setImage(with: URL(string: poke.sprites.sprite), completed: nil)
        }
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        
        guard let currentCell = tableView.cellForRow(at: indexPath) as? PokemonCell else {return}
        let poke = pokemonArray[indexPath.row]
        
        vc?.image = currentCell.pokemonImageView.image!
        vc?.name = currentCell.nameLabel.text!
        vc?.moves = poke.movesArray.compactMap({$0.move.moveName}).joined(separator: ", ")
        vc?.elements = currentCell.detailLabel.text!
        vc?.index = "Index: \(currentCell.indexLabel.text!)"
        
        
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    private func getPokemon(withID id: Int) {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)") else {
            print("URL guard stmt failed")
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            
            if let data = data {
                guard let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) else {
                    print("Error decoding data \(error!)")
                    return
                }
                
                self?.pokemonArray.append(pokemon)
            }
            self?.loading = false
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }.resume()
    }
    
    private func makeMoveArray(index: Int) {
        let movesCount: Int = pokemonArray[index].movesArray.count
        
        for move in (0..<movesCount) {
            let myMove: String = pokemonArray[index].movesArray[move].move.moveName
            moves?.append(myMove)
        }
        
    }
    
    
    
    
    


}



