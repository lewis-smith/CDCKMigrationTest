//
//  ViewController.swift
//  CDCKMigrationTest
//
//  Created by Lewis Smith on 16/06/2020.
//  Copyright © 2020 Lasmit. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    var entity: Entity? {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        let results = try! delegate.persistentContainer.viewContext.fetch(fetchRequest)

        return results.first as? Entity

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let entity = entity {
            textField.text = entity.text
            if var text = entity.text {
                text += "\n"
                entity.text = text
            } else {
                entity.text = ""
            }

            guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }

            delegate.saveContext()
        }
    }

    @IBAction func saveTapped(_ sender: UIButton) {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        var ent = entity
        if ent == nil {
            print("Creating entity")
            ent = Entity(context: delegate.persistentContainer.viewContext)
        }
        ent?.text = textField.text

        delegate.saveContext()
        print("Context saved")
    }
}

