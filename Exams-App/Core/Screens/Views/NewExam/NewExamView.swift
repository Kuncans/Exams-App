//
//  NewExamView.swift
//  Exams-App
//
//  Created by Duncan Kent on 02/03/2022.
//

import SwiftUI

struct NewExamView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Environment (\.dismiss) var dismiss
    @State private var dropdownExpanded = false
    
    var body: some View {
        
            ZStack {
                
                Color.white.edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    ZStack {
                        Color.theme.backgroundCard
                            .frame(maxWidth: .infinity)
                            .frame(height: 178)
                            .ignoresSafeArea()
                        
                        HStack {
                            
                            Image(systemName: "arrow.left")
                                .renderingMode(.template)
                                .foregroundColor(.theme.accentSecondary)
                                .onTapGesture {
                                    dismiss()
                                    vm.selectedTab = 3
                                }

                            Text("Create New Exam")
                                .font(.interSemibold16)
                                .foregroundColor(Color.theme.textSecondary)
                            
                            Spacer()
                            
                            Button(action: {}) {
                                Text("Next")
                                    .font(.interMedium16)
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.theme.accentSecondary, lineWidth: 1)
                            )

                        }
                        .padding(.horizontal)
                    }
                    
                    HStack {
                        Text("Classroom:")
                            .font(.interRegular14)
                            .padding(.trailing)
                            .frame(width: 90)
                        Spacer()
                        ZStack {
                            
                            
                            DisclosureGroup(vm.newExamClassroom?.name ?? "Select Classroom", isExpanded: $dropdownExpanded) {
                                ForEach(vm.classrooms, id: \.self) { classroom in
                                    if vm.newExamClassroom?.name != classroom.name {
                                        Spacer(minLength: 5.0)
                                        VStack {
                                            Text(classroom.name)
                                                .font(.interRegular12)
                                                .foregroundColor(.theme.accentSecondary)
                                                .padding(.vertical, 4)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .onTapGesture {
                                                    vm.newExamClassroom = classroom
                                                    withAnimation {
                                                        dropdownExpanded = false
                                                    }
                                                }
                                                .lineLimit(1)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))
                            .lineLimit(1)
                            .foregroundColor((vm.newExamClassroom != nil) ? Color.theme.accentSecondary : Color.theme.textSecondary)
                            .font(.interRegular14)
                        }
                        .frame(width: 250, height: 45, alignment: .leading)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("Syllabus:")
                            .font(.interRegular14)
                            .padding(.trailing)
                            .frame(width: 90, alignment: .leading)
                        
                        TextField("Enter modules here", text: $vm.newExamModule)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))
                            .font(.interRegular14)
                            .foregroundColor(.theme.accentSecondary)
                            .padding(.leading, 10)
 
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                }
                .navigationBarHidden(true)
            }
        }
}

struct NewExamView_Previews: PreviewProvider {
    static var previews: some View {
        NewExamView()
            .environmentObject(HomeViewModel())
    }
}
