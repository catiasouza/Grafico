//
//  BarChart.swift
//  Grafico
//
//  Created by Cátia Souza on 24/03/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import UIKit

class BarChart: UIView {
    
    var dados = [0,0,0,0,0]
    var context: CGContext!
    
    override func draw(_ rect: CGRect){
        super.draw(rect)
        context = UIGraphicsGetCurrentContext()!
        desenharOsEixos()
        desenharAsBarras()
    }
    private func desenharOsEixos(){
        
        //Eixos horizontais
        context.beginPath()
        var espacoEntreOsEixos = bounds.height*0.9/5
        var eixoAtual = bounds.height*0.05
        while eixoAtual < bounds.height {
            context.move(to: CGPoint(x: 0, y: eixoAtual))
            context.addLine(to: CGPoint(x: bounds.width*0.9, y:eixoAtual))
            eixoAtual += espacoEntreOsEixos
        }
        context.strokePath()
        context.setStrokeColor(UIColor.lightGray.cgColor)
        context.setLineWidth(0.5)
        context.beginPath()
        context.setLineDash(phase: 0, lengths: [1,2])
        espacoEntreOsEixos = bounds.width*0.9/11
        eixoAtual = espacoEntreOsEixos
        while eixoAtual <= bounds.width*0.9{
            context.move(to: CGPoint(x: eixoAtual, y: 0))
            context.addLine(to: CGPoint(x: eixoAtual, y:bounds.height-bounds.height*0.05))
            eixoAtual += espacoEntreOsEixos
        }
        context.strokePath()
        
        //
        //        context.beginPath()
        //        var espacoEntreOsEixos = bounds.height*0.9/5
        //        var eixoAtual = bounds.height*0.05
        //        while eixoAtual < bounds.height {
        //            context.move(to: CGPoint(x: 0, y: eixoAtual))
        //            context.addLine(to: CGPoint(x: bounds.width*0.9, y:eixoAtual))
        //            eixoAtual += espacoEntreOsEixos
        //        }
        //        context.strokePath()
    }
    private func desenharAsBarras(){
        context.setStrokeColor(UIColor.orange.cgColor)
        context.setLineWidth(bounds.width*0.9/11)
        context.setLineDash(phase: 0, lengths: [])
        context.beginPath()
        let espacoEntreOsEixos = bounds.width*0.9/11
        var eixoAtual = espacoEntreOsEixos + espacoEntreOsEixos/2
        for i in dados{
            context.move(to: CGPoint(x: eixoAtual, y: bounds.height*0.95))
            context.addLine(to: CGPoint(x: eixoAtual, y: bounds.height*0.95-bounds.height*0.90/CGFloat(valorMaximo())*CGFloat(i)))
            eixoAtual += espacoEntreOsEixos*2
        }
        context.strokePath()
    }
    public func atualizar(_ dados: [Int]){
        self.dados = dados
        self.subviews.forEach { $0.removeFromSuperview() }
        self.setNeedsDisplay()
    }
    private func valorMaximo() -> Int{
        var maior = 5
        for valor in dados{
            if valor > maior{
                maior = valor
            }
        }
        while maior % 5 != 0{
            maior += 1
        }
        return maior
    }
}
