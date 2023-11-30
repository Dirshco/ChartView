// SavingHistory.swift

import SwiftUI
import Charts
import Foundation

struct SavingSBPModel: Identifiable {
    let id = UUID()
    let SBP: Int
    let DBP: Int
    let createdAt: Date
}

struct SavingHistory: View {
    let list = [
        SavingSBPModel(SBP: 100, DBP: 70, createdAt: DateFormatter().date(from: "23/11") ?? Date()),
        SavingSBPModel(SBP: 110, DBP: 75, createdAt: DateFormatter().date(from: "23/11") ?? Date()),
        SavingSBPModel(SBP: 160, DBP: 80, createdAt: DateFormatter().date(from: "24/11") ?? Date()),
        SavingSBPModel(SBP: 130, DBP: 85, createdAt: DateFormatter().date(from: "25/11") ?? Date()),
        SavingSBPModel(SBP: 150, DBP: 90, createdAt: DateFormatter().date(from: "26/11") ?? Date()),
        SavingSBPModel(SBP: 120, DBP: 95, createdAt: DateFormatter().date(from: "27/11") ?? Date()),
        SavingSBPModel(SBP: 140, DBP: 100, createdAt: DateFormatter().date(from: "28/11") ?? Date()),
    ]

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
    }()

    var body: some View {
        Chart(list) { savingSBPModel in
            LineMark(
                x: .value("Date", savingSBPModel.createdAt),
                y: .value("SBP", savingSBPModel.SBP)
            )
            .foregroundStyle(.red)

            LineMark(
                x: .value("Date", savingSBPModel.createdAt),
                y: .value("DBP", savingSBPModel.DBP)
            )
            .foregroundStyle(.blue)
        }
        .chartXAxis {
            AxisMarks(position: .leading)
                .labels { label in
                    label.formatter = dateFormatter
                }
        }
    }
}
