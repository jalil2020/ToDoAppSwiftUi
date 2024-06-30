//
//  TaskItem.swift
//  TASK
//
//  Created by macbook pro on 29/06/24.
//

import SwiftUI

struct TaskItem: View {
    var task: TaskData
    @State var isComplected:Bool = false
    @State var isShowBottomSheet:Bool = false
    @EnvironmentObject var vm: MainViewModel

    init(task: TaskData) {
        self.task = task
        isComplected = task.isComplected
    }

    var body: some View {
        HStack {
            Image(uiImage:task.image ?? UIImage(resource: .imageHolderIcon))
                .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 120, height: 120)
                  .cornerRadius(20)
                  .padding()
            
            VStack(alignment:.leading){
                Text(task.title)
                    .titleTextStyle()
                
                Text(task.descreption)
                    .descriptionTextStyle()
                
                Text(task.date.formatted())
                    .descriptionTextStyle()
                    .bold()
                    .italic()

            }
            Toggle(isOn: $isComplected) {
                  }
                  .toggleStyle(CheckboxToggleStyle())
                  .foregroundColor(secondaryColor)
                  .padding()
        }
        .background(
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(secondaryColor, lineWidth: 5)
                )
        )
        .onChange(of: isComplected, {
            vm.changeTaskStatus(b: isComplected, id: task.id)
        })
        .onTapGesture {
            isShowBottomSheet.toggle()
                debugPrint("Whole view as touch")
            }
        .sheet(isPresented: $isShowBottomSheet, content: {
            VStack {
                Image(uiImage:task.image ?? UIImage(resource: .imageHolderIcon))
                    .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 200, height: 200)
                      .cornerRadius(20)
                      .padding()
                
                VStack(alignment:.leading){
                    Text(task.title)
                        .titleTextStyle()
                    
                    Text(task.descreption)
                        .descriptionTextStyle()
                    
                    Text(task.date.formatted())
                        .descriptionTextStyle()
                        .bold()
                        .italic()

                }
//                Toggle(isOn: $isComplected) {
//                      }
//                      .toggleStyle(CheckboxToggleStyle())
//                      .foregroundColor(secondaryColor)
//                      .padding()
            }
            
        })
    }
}



#Preview {
    TaskItem(task: TaskData.init(id: "String",
                                 title: "String",
                                 descreption: "String",
                                 date: Date.now))
}
