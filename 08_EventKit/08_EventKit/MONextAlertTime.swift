//
//  MONextAlertTime.swift
//  08_EventKit
//
//  Created by moxiaoyan on 2019/9/4.
//  Copyright © 2019 moxiaoyan. All rights reserved.
//

import Foundation
import EventKit

struct MOTool {
  
  func nextAlertTime(reminder: EKReminder) -> Date? {
    if !reminder.hasAlarms {
      return nil // 没有提醒时间
    }
    if reminder.isCompleted {
      return nil // 已完成
    }
    
    var alarmDates: [Date] = []
    
    if !reminder.hasRecurrenceRules { // 不重复
      // 判断alarm时间是否已过
      for alarm in reminder.alarms! {
        guard let absoluteDate = alarm.absoluteDate else {
          continue // 没有提醒时间
        }
        if absoluteDate.compare(Date()) == .orderedDescending {  // 未过
          alarmDates.append(absoluteDate)
        } else {  // 已过
          continue
        }
      }
      return nearlyDate(dates: alarmDates)
    }
    
    // 重复
    for rule: EKRecurrenceRule in reminder.recurrenceRules ?? [] { // rules <-> alarms 多条规则多个提醒时间
      if rule.recurrenceEnd?.endDate?.compare(Date()) == .orderedAscending {
        continue  // 已结束重复
      }
      print("当前时间: \(Date())")
      print("frequency: \(rule.frequency.rawValue)")
      print("interval: \(rule.interval)")
      print("firstDayOfTheWeek: \(rule.firstDayOfTheWeek)")
      print("daysOfTheWeek: \(rule.daysOfTheWeek)")
      print("daysOfTheMonth: \(rule.daysOfTheMonth)")
      print("daysOfTheYear: \(rule.daysOfTheYear)")
      print("weeksOfTheYear: \(rule.weeksOfTheYear)")
      print("monthsOfTheYear: \(rule.monthsOfTheYear)")
      print("setPositions: \(rule.setPositions)")
      
      switch rule.frequency {

      case .daily:  // 每天重复
        for alarm in reminder.alarms! {
          guard let absoluteDate = alarm.absoluteDate else {
            continue // 没有提醒时间
          }
          if absoluteDate.compare(Date()) == .orderedDescending { // 第一次提醒时间还没过
            alarmDates.append(absoluteDate)
          } else { // 第一次提醒时间已过
            // 计算下一次提醒时间
            var nextAlarmDate = absoluteDate
            while nextAlarmDate.compare(Date()) == .orderedAscending {
              nextAlarmDate = nextAlarmDate.dateByAdding(rule.interval, Calendar.Component.day).date
            }
            alarmDates.append(nextAlarmDate)
          }
        }
        
      case .weekly:  // 每周重复
        print("")
        for alarm in reminder.alarms! {
          guard let absoluteDate = alarm.absoluteDate else {
            continue // 没有提醒时间
          }
          if absoluteDate.compare(Date()) == .orderedDescending { // 第一次提醒时间还没过
            alarmDates.append(absoluteDate)
          } else { // 第一次提醒时间已过
            // 计算下一次提醒时间
            
            
            
            // 1. 以提醒周的 `最后一天 最后一刻` ，往后推算
            var nextAlarmDate = absoluteDate.dateByAdding(rule.interval, Calendar.Component.weekday).date
            nextAlarmDate = nextAlarmDate.dateAtEndOf(Calendar.Component.weekday)
            if let date = nextAlarmDate.dateBySet([Calendar.Component.weekday : 7]) {
              nextAlarmDate = date
            }
            // 2. 循环+interval周 直到当前时间 早于 `最后一天 最后一刻`
            while nextAlarmDate.compare(Date()) == .orderedAscending {
              nextAlarmDate = absoluteDate.dateByAdding(rule.interval, Calendar.Component.weekday).date
            }
            // 3. 遍历需要重复的周几，第一个晚于当前时间的 就是了
            var weekDays: [Int] = []
            if rule.daysOfTheWeek?.count ?? 0 > 0 {
              for weekDay: EKRecurrenceDayOfWeek in rule.daysOfTheWeek ?? [] {
                weekDays.append(weekDay.dayOfTheWeek.rawValue)
              }
            } else {
              weekDays = [absoluteDate.weekday]
            }
            for weekDay in weekDays {
              let compontent = [Calendar.Component.year : nextAlarmDate.year,
                                Calendar.Component.month : nextAlarmDate.month,
                                Calendar.Component.weekday : weekDay]
              guard let resultAlarm = absoluteDate.dateBySet(compontent)?.date else {
                continue
              }
              if resultAlarm.compare(Date()) == .orderedAscending {
                
              }
            }

            // 当周 是不是提醒周
            // 是 当周提醒时间 是否已过
            // 否 再下一次提醒的周 的第一个提醒时间
//
//
//            let daysOfWeek = rule.daysOfTheWeek ?? []
//            if daysOfWeek.count == 0 { // 没有多天
//              // 则根据设置的时间判断周几
//
//
//            } else {
//
//
//            }
//            var nextAlarmDate = absoluteDate
//            while nextAlarmDate.compare(Date()) == .orderedAscending {
//              nextAlarmDate = absoluteDate.dateByAdding(rule.interval, Calendar.Component.weekday).date
//            }
//            alarmDates.append(nextAlarmDate)
          }
        }
        
        
//        for alarm in reminder.alarms! {
//          guard let absoluteDate = alarm.absoluteDate else {
//            continue // 没有提醒时间
//          }
//          if absoluteDate.compare(Date()) == .orderedDescending { // 第一次提醒时间还没过
//            alarmDates.append(absoluteDate)
//          } else { // 第一次提醒时间已过
//            // 计算下一次提醒时间 (保留time，更换为t日期) 周几？？
//
//            let daysOfWeek = rule.daysOfTheWeek ?? []
//            if daysOfWeek.count == 0 { // 没有多天
//
//
//            } else { // 则根据设置的时间判断周几
//
//
//            }
//            for daysOfWeek in rule.daysOfTheWeek ?? [] { // 都周几需要重复
//
//            }
//
//            let compontent = [Calendar.Component.year : Date().year,
//                              Calendar.Component.month : Date().month,
//                              Calendar.Component.weekday : 1]
//            guard let thisWeekAlarm = absoluteDate.dateBySet(compontent)?.date else {
//              continue
//            }
//            if thisWeekAlarm.compare(Date()) == .orderedDescending {  // 当周时间还没过
//              alarmDates.append(thisWeekAlarm)
//            } else {  // 当周时间已过
//              // 计算下一周提醒时间
//              let compontent = [Calendar.Component.day : Date().day + 1]
//              guard let tomorrowAlarm = absoluteDate.dateBySet(compontent)?.date else {
//                continue
//              }
//              alarmDates.append(tomorrowAlarm)
//            }
//          }
//        }
        

      case .monthly:  // 每月重复
        print("")
      case .yearly:  // 每年重复
        print("year")
//        for alarm in reminder.alarms! {
//          guard let absoluteDate = alarm.absoluteDate else {
//            continue // 没有提醒时间
//          }
//          if absoluteDate.compare(Date()) == .orderedDescending { // 第一次提醒时间还没过
//            alarmDates.append(absoluteDate)
//          } else {
//            if rule.daysOfTheYear?.count == 0 {
//              continue
//            }
//            if absoluteDate.year == Date().year {
//              // 下一次提醒时间
//              for day in rule.daysOfTheYear ?? [] {
//
//                if day.intValue < Date().dayOfYear {
//                  continue
//                }
//                if day.intValue == Date().dayOfYear {
//                  let compontent = [Calendar.Component.day : day.intValue]
//                  guard let todayAlarm = absoluteDate.dateBySet(compontent)?.date else {
//                    continue // 换算今天时间出错
//                  }
//                  if todayAlarm.compare(Date()) == .orderedDescending {  // 当天时间还没过
//                    alarmDates.append(todayAlarm)
//                    break
//                  }
//                }
//                // 计算下一次提醒时间
//                guard let nextAlarm = yearNextAlarm(absoluteDate, rule) else {
//                  continue
//                }
//                alarmDates.append(nextAlarm)
//              }
//            } else { // absoluteDate.year < Date().year
//              // 计算下一次提醒时间
//              guard let nextAlarm = yearNextAlarm(absoluteDate, rule) else {
//                continue
//              }
//              alarmDates.append(nextAlarm)
//            }
//          }
//        }
      default: break
      }
    }
    return nearlyDate(dates: alarmDates)
  }
  
  func yearNextAlarm(_ absoluteDate: Date, _ rule: EKRecurrenceRule) -> Date? {
    var year = absoluteDate.year + rule.interval
    while year < Date().year {
      year = absoluteDate.year + rule.interval
    }
    if year == Date().year { // 今年有提醒
      for day in rule.daysOfTheYear! {
        // 一年中的第几天 -> 年月日
        let thisYearFirstDate = Date().dateAtStartOf(Calendar.Component.year)
        let nextDay = thisYearFirstDate.dateByAdding(day.intValue, Calendar.Component.day).date
        if nextDay.compare(Date()) == .orderedDescending {  // 时间还没过
          return nextDay
        }
      }
    } else if year == Date().year + 1 { // 明年有提醒
      let compontent = [Calendar.Component.year : year]
      guard let nextYearFirstDate = Date().dateBySet(compontent)?.date else {
        return nil
      }
      for day in rule.daysOfTheYear! {
        // 一年中的第几天 -> 年月日
        let nextDay = nextYearFirstDate.dateByAdding(day.intValue, Calendar.Component.day).date
        if nextDay.compare(Date()) == .orderedDescending {  // 时间还没过
          return nextDay
        }
      }
    } else {
      return nil
    }
    return nil
  }
  
  func nearlyDate(dates:[Date]?) -> Date? {
    if dates?.count ?? 0 == 0 {
      return nil
    }
    // 排序，返回最早的时间
    let sortedDates = dates!.sorted { (date1, date2) -> Bool in
      return date1.compare(date2) == .orderedAscending
    }
    return sortedDates.first
  }
}
