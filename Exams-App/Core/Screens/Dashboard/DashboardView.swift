//
//  DashboardView.swift
//  Exams-App
//
//  Created by Duncan Kent on 01/03/2022.
//

import SwiftUI

struct DashboardView: View {
    
    let user: User
    
    let classes: [String] = [MockClassroom.classroom.name, "Data Protection Survey"]
    
    @State private var dropdownExpanded = false
    @State var selectedClass = MockClassroom.classroom
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Color.theme.backgroundCard.edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    header
                    
                    examinations
                    
                    VStack {
                        
                        Text("Attendance")
                            .font(.interMedium18)
                            .foregroundColor(.theme.textSecondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        DisclosureGroup(selectedClass.name, isExpanded: $dropdownExpanded) {
                            ForEach(classes, id: \.self) { className in
                                if selectedClass.name != className {
                                    Text(className)
                                        .foregroundColor(.theme.accentPrimary)
                                        .padding(.vertical, 2)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .onTapGesture {
                                            //selectedClass = className
                                            dropdownExpanded = false
                                        }
                                }
                            }
                        }
                        .padding([.vertical, .trailing])
                        
                        HStack {
                            
                            Spacer()
                            
                            AttendanceProgressView(attendance: Float(selectedClass.classAttendance))
                                .frame(width: 100, height: 100)
                                .padding()

                            Spacer(minLength: 30)
                                
                            attendanceStats
                                                    
                            Spacer()
                            
                        }
                        
                        HStack {
                            Image(systemName: "bell.fill")
                            
                            Text("Your attendance seems to be low in \(selectedClass.classNameAbbreivation)")
                                .font(.robotoRegular)
                        }
                        .padding(.horizontal, 18)
                        .padding(.vertical, 10)
                        .foregroundColor(.theme.accentBlue)
                        .background(Color.theme.accentBlueSecondary.opacity(0.2))
                        .cornerRadius(5)
                        .padding(.bottom, 12)
                        .opacity(selectedClass.classAttendance < 75.0 ? 1.0 : 0.0)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 18)
                    .background(.white)
                    
                    Spacer()
                }
                
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: MockUser.user)
    }
}

extension DashboardView {
    
    private var header: some View {
        
        HStack {
            
            VStack (alignment: .leading) {
                Text("Hello \(user.name)")
                    .font(.interMedium28)
                    .foregroundColor(.theme.accentPrimary)
                Text("Welcome to your **Dashboard**")
                    .font(.interMedium14)
                    .foregroundColor(.theme.accentSecondary)
            }
            
            Spacer()
            
            Image(user.image)
                .resizable()
                .clipShape(Circle())
                .frame(width: 40, height: 40)
            
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 36)
        
    }
    
    private var examinations: some View {
        
        VStack {
            HStack {
                Text("Examinations")
                    .font(.interMedium18)
                    .foregroundColor(.theme.textSecondary)
                Spacer()
                Button {
                    print("Add Exam")
                } label: {
                    Image(systemName: "plus")
                        .tint(Color.theme.accentSecondary)
                }
                
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 28) {
                    ExamCardView(exam: MockExam.exam)
                    ExamCardView(exam: MockExam.exam)
                }
            }
            .frame(height: 180)
            
        }
        .padding([.horizontal, .top], 20)
        .padding(.bottom, 12)
        .background(.white)
        .frame(maxWidth: .infinity)
    }
    
    private var attendanceStats: some View {
        
        VStack (spacing: 16) {
            
            HStack {
                Text("Total Classes")
                    .font(.interMedium12)
                    .foregroundColor(.theme.textTertiary)
                
                Spacer()
                
                Text("\(selectedClass.classesTotal)")
                    .font(.interMedium12)
                    .foregroundColor(.black)
            }
            .padding(.trailing, 8)
            
            HStack {
                Text("Classes Attended")
                    .font(.interMedium12)
                    .foregroundColor(.theme.textTertiary)
                
                Spacer()
                
                Text("\(selectedClass.classesAttended)")
                    .font(.interMedium12)
                    .foregroundColor(.black)
            }
            .padding(.trailing, 8)
            
            HStack {
                Text("Classes Missed")
                    .font(.interMedium12)
                    .foregroundColor(.theme.textTertiary)
                
                Spacer()
                
                Text("\(selectedClass.classesMissed)")
                    .font(.interMedium12)
                    .foregroundColor(.black)
            }
            .padding(.trailing, 8)
            
            HStack {
                Text("Classes Left")
                    .font(.interMedium12)
                    .foregroundColor(.theme.textTertiary)
                
                Spacer()
                
                Text("\(selectedClass.classesLeft)")
                    .font(.interMedium12)
                    .foregroundColor(.black)
            }
            .padding(.trailing, 8)
            
            
        }
        
    }
    
}
