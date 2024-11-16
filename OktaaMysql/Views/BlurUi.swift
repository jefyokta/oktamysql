//
//  BlurUi.swift
//  OktaaMysql
//
//  Created by mac on 20/09/24.
//

import SwiftUI

struct BlurUi: NSViewRepresentable {
  
    func makeNSView(context: Context) -> 
            NSVisualEffectView {
            let view = NSVisualEffectView();
          
            view.blendingMode = .behindWindow
            return view
        }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        
    }
    
}

#Preview {
    BlurUi()
}
