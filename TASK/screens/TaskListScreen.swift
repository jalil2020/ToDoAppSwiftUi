//
//  TaskListScreen.swift
//  TASK
//
//  Created by macbook pro on 29/06/24.
//

import SwiftUI

struct TaskListScreen: View {
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
                        .foregroundColor(secondaryColor)
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
                .frame(height: .infinity)
            
            Button {
                isShowingCreateTask.toggle()
                } label: {                                   Image(systemName: "plus")
                           .font(.title.weight(.semibold))
                           .padding()
                           .background(secondaryColor)
                           .foregroundColor(.white)
                           .clipShape(Circle())
                        }
                        .padding()
        }
        )
        .background(.white)
        .foregroundColor(.blue)})
        .background(.white)
        .onAppear(perform: {
            vm.filterAndSort()
            
            print("date: \(vm.tempList)")
        })
        .environmentObject(vm)
        

        
    }
}

#Preview {
    TaskListScreen()
}
