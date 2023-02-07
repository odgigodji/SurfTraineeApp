//
//  MainViewOutput.swift
//  mSurfTraineeAppvp
//
//  Created by Nikita Evdokimov on 07.02.23.
//

import Foundation

//ответственнен за связь с презентером, мы отсюда что то вызываем возвращаем

protocol PresenterOutput: AnyObject {
    func didPressedAction()
//    func updateDataManger()
}
