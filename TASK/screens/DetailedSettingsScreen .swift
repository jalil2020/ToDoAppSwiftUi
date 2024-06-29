//
//  DetailedSettingsScreen .swift
//  TASK
//
//  Created by macbook pro on 29/06/24.
//

import SwiftUI

struct DetailedSettingsScreen: View {
    @EnvironmentObject var vm: MainViewModel

    let statusSort = [StatusData.NONE.rawValue, StatusData.COMPLECTED.rawValue, StatusData.PENDING.rawValue]
    
    var body: some View {
        VStack{
            GroupBox("Sorting Features") {
                VStack(alignment: .leading) {
                    HStack{
                        Toggle("Date in descending order", isOn:$vm.isDescendingSort)
                        Spacer()
                    }
                    HStack{
                        Text("Status")
                        Spacer()
                        Picker("Select a paint color", selection: $vm.complectedSort) {
                        ForEach(statusSort, id: \.self) {
                                    Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                }
                .frame(width: .infinity)
            }
            
            GroupBox("Filtering Features") {
                VStack(alignment: .leading) {
                    HStack{
                        Text("Status Filtering")
                        Spacer()
                        Picker("Select a paint color", selection: $vm.filter) {
                                ForEach(statusSort, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.menu)
                    }
                  
                }
                .frame(width: .infinity)
            }
        }
        .onChange(of: vm.isDescendingSort, { oldValue, newValue in
            vm.setIsDescendingSort(b: vm.isDescendingSort)
        })
        .onChange(of: vm.complectedSort, { oldValue, newValue in
            vm.setComplectedSort(status: vm.complectedSort)
        })
        .onChange(of: vm.filter, { oldValue, newValue in
            vm.setFilter(status: vm.filter)
        })
        .padding(.horizontal,16)
      
    }
    
}

func getActionSheet() -> ActionSheet {
    //return ActionSheet(title: Text("This is the title!"))
    let button1: ActionSheet.Button = .default (Text ("DEFAULT" ) )
    let button2: ActionSheet.Button = .destructive (Text ("DESTRUCTIVE") )
    let button3: ActionSheet.Button = .cancel()
    
    
    return ActionSheet (
        title: Text("This is the title!"), message: Text("This is the message."),
        buttons: [button1, button2, button3, button1, button1, button2, button2])
}
#Preview {
    DetailedSettingsScreen()
}
