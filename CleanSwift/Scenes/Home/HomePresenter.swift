//
//  HomePresenter.swift
//  CleanSwift
//
//  Created by Lukasz szyszkowski on 13.11.2016.
//  Copyright (c) 2016 Lukasz Szyszkowski. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import ChainedAttributedString

protocol HomePresenterInput
{
  func presentUpdatedText(response:Home.UpdateTextLabel.Response)
  func presentEditTextViewController(response:Home.EditText.Response)
  func presentUpdatedChangeTextButton(response:Home.UpdateChangeTextButton.Response)
  func presentUpdatedView()
}

protocol HomePresenterOutput: class
{
  func updateTextLabel(model:Home.UpdateTextLabel.ViewModel)
  func updateChangeTextButton(model:Home.UpdateChangeTextButton.ViewModel)
  func showEditViewController(model:Home.EditText.ViewModel)
  func updateView(model:Home.UpdateView.ViewModel)
}

class HomePresenter: HomePresenterInput
{
  weak var output: HomePresenterOutput!
  
  func presentUpdatedView() {
    let model = Home.UpdateView.ViewModel(backgroundColor: Color.LightGray.rawValue)
    output.updateView(model)
  }
  
  func presentUpdatedText(response: Home.UpdateTextLabel.Response) {
    let model =
      Home.UpdateTextLabel.ViewModel(
        text: response.text.attributedString()
          .font(Font.bold(FontSize.large.rawValue).make)
          .textColor(Color.Graphite.make)
    )
    output.updateTextLabel(model)
  }
  
  func presentEditTextViewController(response: Home.EditText.Response) {
    let model = Home.EditText.ViewModel(text: response.text)
    output.showEditViewController(model)
  }
  
  func presentUpdatedChangeTextButton(response: Home.UpdateChangeTextButton.Response) {
    let model = Home.UpdateChangeTextButton.ViewModel(
      title: response.title.attributedString()
        .font(Font.bold(FontSize.medium.rawValue).make)
        .textColor(Color.Lime.make),
      backgroundColor: Color.Graphite.rawValue,
      cornerRadius: Globals.Button.cornerRadius
    )
    output.updateChangeTextButton(model)
  }
}
