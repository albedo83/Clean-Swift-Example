//
//  HomeInteractor.swift
//  CleanSwift
//
//  Created by Lukasz szyszkowski on 13.11.2016.
//  Copyright (c) 2016 Lukasz Szyszkowski. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol HomeInteractorInput
{
  func changeTextButtonAction()
  func updateTextLabel()
  func updateChangeTextButton()
  func updateView()
}

protocol HomeInteractorOutput
{
  func presentUpdatedView()
  func presentUpdatedText(response:Home.UpdateTextLabel.Response)
  func presentEditTextViewController(response:Home.EditText.Response)
  func presentUpdatedChangeTextButton(response:Home.UpdateChangeTextButton.Response)
}

class HomeInteractor: HomeInteractorInput
{
  var output: HomeInteractorOutput!
  private let worker =  HomeWorker()
  
  func updateView() {
    output.presentUpdatedView()
  }
  
  func updateTextLabel() {
    worker.fetchText {[weak self] text in
      let response = Home.UpdateTextLabel.Response(text: text)
      self?.output.presentUpdatedText(response)
    }
  }
  
  func updateChangeTextButton() {
    let response = Home.UpdateChangeTextButton.Response(title: NSLocalizedString("change text", comment: "Home VC change text button title"))
    output.presentUpdatedChangeTextButton(response)
  }
  
  func changeTextButtonAction() {
    worker.fetchText { [weak self] text in
      let response = Home.EditText.Response(text: text)
      self?.output.presentEditTextViewController(response)
    }
  }
}