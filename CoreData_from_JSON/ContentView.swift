//
//  ContentView.swift
//  CoreData_from_JSON
//
//  Created by Jake Nelson on 3/11/19.
//  Copyright © 2019 Jake Nelson. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // ❇️ Core Data property wrappers
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(fetchRequest: usersFetchRequest(), animation: nil) var Users : FetchedResults<User>
    
    @State var filtered = [User]()
    @State var filter: String = ""
    
    static func usersFetchRequest() -> NSFetchRequest<User> {
        let request : NSFetchRequest = User.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        return request
    }
    
    var body: some View {
        VStack{
            
            TextField("Search", text: $filter)
            
            Text("Hello, World!")
            
            Button(action: {
                self.loadData()
            }) {
                Text("Load Data")
            }
            
            Button(action: {
                self.filterUsers(filter: self.filter)
            }) {
                Text("Filter")
            }
            List{
                ForEach(self.filtered, id: \.self) { user in
                    Text(user.first_name ?? "nada")
                }
            }
            
        }
        .onAppear {
            self.filterUsers(filter: self.filter)
        }
        
    }
    
    fileprivate func filterUsers(filter: String) {
            self.filtered = []
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
                if filter == "" {
                    // TODO: fix this hack
                    self.filtered = self.Users.filter { $0.id > -1 }
                }
                else {
                    self.filtered = self.Users.filter { $0.first_name!.contains(filter) }
                }
                return
            }
        }
    
    
    func loadData(){
        for each in json_user_data {
            print(each.first_name)
            let new = User(context: self.managedObjectContext)
            new.first_name = each.first_name
            new.last_name = each.last_name
            new.email = each.email
            new.gender = each.gender
            new.ip_address = each.ip_address
            new.id = Int16(each.id)
            do {
                try self.managedObjectContext.save()
            } catch {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

