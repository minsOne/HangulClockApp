//
//  MainRouter.swift
//  Main
//
//  Created by minsone on 2020/02/07.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs

public protocol MainInteractable: Interactable {
    var router: MainRouting? { get set }
    var listener: MainListener? { get set }
}

public protocol MainViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

public final class MainRouter: LaunchRouter<MainInteractable, MainViewControllable>, MainRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    public override init(interactor: MainInteractable, viewController: MainViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
