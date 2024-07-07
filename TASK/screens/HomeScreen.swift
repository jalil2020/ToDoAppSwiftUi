//
//  TaskListScreen.swift
//  TASK
//
//  Created by macbook pro on 29/06/24.
//

import SwiftUI

struct HomeScreen: View {
    @State private var isShowingCreateTask = false
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var vm: MainViewModel
    
    var body: some View {
        NavigationView(content: {
            
            ZStack(alignment: .bottomTrailing,content: {
                NavigationLink(destination: CreationScreen(), isActive:$isShowingCreateTask) {}
                
                List{
                    Text("Task List")
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                    ForEach(0..<vm.tempList.count, id: \.self){ index in
                        TaskItem(task:vm.tempList[index])
                            .swipeActions(edge:.trailing) {
                                Button("Delete") {
                                    vm.removeTask(idd: vm.taskList[index].id)
                                }
                                .tint(.red)
                            }
                    }
                }
                
                Button {
                    isShowingCreateTask.toggle()
                } label: {                                  
                    Image(systemName: "pencil")
                        .font(.title.weight(.semibold))
                        .padding()
                        .background(primaryColor)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                .padding()
                Spacer()
            })
            .background(.red)
            .frame(width: .infinity, height: .infinity)
            .foregroundColor(.blue)
        }
        )
        .background(.red)
        .onAppear(perform: {
            vm.filterAndSort()
            
            print("date: \(vm.tempList)")
        })
        .environmentObject(vm)
        

        
    }
}

#Preview {
    HomeScreen()
}
