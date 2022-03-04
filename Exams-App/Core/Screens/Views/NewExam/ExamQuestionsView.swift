//
//  ExamQuestionsView.swift
//  Exams-App
//
//  Created by Duncan Kent on 03/03/2022.
//

import SwiftUI

struct ExamQuestionsView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Environment (\.dismiss) var dismiss
        
    var body: some View {
        
        ZStack {
            
            Color.white.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    
                    ZStack {
                        Color.theme.backgroundCard
                            .frame(maxWidth: .infinity)
                            .frame(height: 178)
                            .ignoresSafeArea(edges: .top)
                            .offset(y: -48)
                        
                        
                        customNavigationBar
                            .ignoresSafeArea(edges: .top)
                        
                    }
                    
                    instructions
                        .padding(.horizontal)
                    
                    ForEach($vm.exam.sections) { section in
                        SectionView(exam: section)
                            .padding(.horizontal)
                            .padding(.bottom, 16)
                    }
                                       
                    Button {
                        // ADD QUESTION TO CURRENT SECTION
                    } label: {
                        Text("Add another question")
                            .font(.interMedium16)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .frame(height: 45)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.theme.accentPrimary.opacity(0.15)))
                            .padding(.horizontal)
                            .padding(.top, 8)
                            .padding(.horizontal)
                    }
                    
                    
                    Button {
                        vm.exam.sections.append(Section())
                    } label: {
                        Text("Add another section")
                            .font(.interMedium16)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .frame(height: 45)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.theme.accentPrimary.opacity(0.15)))
                            .padding(.horizontal)
                            .padding(.top, 8)
                            .padding(.horizontal)
                    }
                    
                    
                    Spacer()
                    
                }
                .navigationBarHidden(true)
            }
        }
    }
}

struct ExamQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        ExamQuestionsView()
            .environmentObject(HomeViewModel())
    }
}

extension ExamQuestionsView {
    
    private var customNavigationBar: some View {
        
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
        .padding(.horizontal, 26)
        
    }
    
    private var instructions: some View {
        
        VStack {
            
            Text("Add Instructions")
                .font(.interRegular14)
                .foregroundColor(.theme.textSecondary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("", text: $vm.newExamModule)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))
                .font(.interRegular14)
                .foregroundColor(.black)
            
        }
        .padding(.horizontal)
        .padding(.bottom, 16)
        
    }
}
