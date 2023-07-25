//
//  ViewController.swift
//  Project 27
//
//  Created by Lucas Neves dos santos pompeu on 24/07/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var currentDrawType = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawRectangle()
    }
    
    @IBAction func redrawTapped(_ sender: Any) {
        currentDrawType += 1
        
        if currentDrawType > 7 {
            currentDrawType = 0
        }
        
        switch currentDrawType {
        case 0:
            drawRectangle()
            
        case 1:
            drawCircle()
            
        case 2:
            drawCheckerBoard()
            
        case 3:
            drawRotatedSquares()
            
        case 4:
            drawLines()
            
        case 5:
            drawImagesAndText()
            
        case 6:
            drawSurprisedEmoji()
            
        case 7:
            drawTwinText()
            
        default:
            break
        }
    }
    
    
    
    func drawRectangle() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
            
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(10)
            
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        imageView.image = image
    }
    
    func drawCircle() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512).insetBy(dx: 5, dy: 5)
            
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(10)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        imageView.image = image
    }
    
    func drawCheckerBoard() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            ctx.cgContext.setFillColor(UIColor.black.cgColor)
            
            for row in 0 ..< 8 {
                for col in 0 ..< 8 {
                    if (row + col).isMultiple(of: 2) {
                        ctx.cgContext.fill(CGRect(x: col * 64, y: row * 64, width: 64, height: 64))
                    }
                }
            }
        }
        
        imageView.image = image
    }
    
    func drawRotatedSquares() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            ctx.cgContext.translateBy(x: 256, y: 256)
            
            let rotations = 16
            let amount = Double.pi / Double(rotations)
            
            for _ in 0 ..< rotations {
                ctx.cgContext.rotate(by: CGFloat(amount))
                ctx.cgContext.addRect(CGRect(x: -128, y: -128, width: 256, height: 256))
            }
            
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.strokePath()
        }
        
        imageView.image = image
    }
    
    func drawLines() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            ctx.cgContext.translateBy(x: 256, y: 256)
            
            var first = true
            var lenght: CGFloat = 256
            
            for _ in 0 ..< 256 {
                ctx.cgContext.rotate(by: .pi / 2)
                
                if first {
                    ctx.cgContext.move(to: CGPoint(x: lenght, y: 50))
                    first = false
                } else {
                    ctx.cgContext.addLine(to: CGPoint(x: lenght, y: 50))
                }
                
                lenght *= 0.99
            }
            
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.strokePath()
        }
        
        imageView.image = image
    }
    
    func drawImagesAndText() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 36),
                .paragraphStyle: paragraphStyle
            ]
            
            let string = "The best-laid schemes o'\nmice an' men gang aft agley"
            
            let attributedString = NSAttributedString(string: string, attributes: attrs)
            attributedString.draw(with: CGRect(x: 32, y: 32, width: 448, height: 448), options: .usesLineFragmentOrigin,  context: nil)
            
            let mouse = UIImage(named: "mouse")
            mouse?.draw(at: CGPoint(x: 300, y: 150))
        }
        
        imageView.image = image
    }
    
    func drawSurprisedEmoji() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            
            let faceWidht = 512
            let faceHeight = 512
            let faceInsets: CGFloat = 20
            
            drawFace(ctx: ctx.cgContext, width: faceWidht, height: faceHeight, insets: faceInsets, startX: 0, startY: 0, fillColor: UIColor.yellow.cgColor, strokeColor: UIColor.orange.cgColor)
            
            let eyeHorizontalMargin: CGFloat = 130
            let eyeTopMargin: CGFloat = 150
            let eyeWidth = 60
            let eyeHeight = 70
            
            let leftEyeStartX = eyeHorizontalMargin
            let leftEyeStartY = eyeTopMargin
            drawEye(ctx: ctx.cgContext, width: eyeWidth, height: eyeHeight, startX: leftEyeStartX, startY: leftEyeStartY, color: UIColor.orange.cgColor)

            let rightEyeStartX = CGFloat(512) - CGFloat(eyeWidth) - eyeHorizontalMargin
            let rightEyrStartY = eyeTopMargin
            drawEye(ctx: ctx.cgContext, width: eyeWidth, height: eyeHeight, startX: rightEyeStartX, startY: rightEyrStartY, color: UIColor.orange.cgColor)

            let mouthWidth = 100
            let mouthHeight = 110
            let mouthStartx = CGFloat((512 - mouthWidth) / 2)
            let mouthStarty = CGFloat(300)

            drawMouth(ctx: ctx.cgContext, width: mouthWidth, height: mouthHeight, startX: mouthStartx, startY: mouthStarty, color: UIColor.orange.cgColor)
        }
        
        imageView.image = image
    }
    
    func drawFace(ctx: CGContext, width: Int, height: Int, insets: CGFloat, startX: CGFloat, startY: CGFloat, fillColor: CGColor, strokeColor: CGColor) {
        let face = CGRect(x: 0, y: 0, width: width, height: height).insetBy(dx: insets, dy: insets)
        
        ctx.setFillColor(UIColor.yellow.cgColor)
        ctx.setStrokeColor(UIColor.orange.cgColor)
        ctx.setLineWidth(5)
        
        ctx.translateBy(x: startX, y: startY)
        ctx.addEllipse(in: face)
        ctx.drawPath(using: .fillStroke)
        ctx.translateBy(x: -startX, y: -startY)
    }
    
    func drawEye(ctx: CGContext, width: Int, height: Int, startX: CGFloat, startY: CGFloat, color: CGColor) {
        let eye = CGRect(x: 0, y: 0, width: width, height: height)

        ctx.setFillColor(color)

        ctx.translateBy(x: startX, y: startY)
        ctx.addEllipse(in: eye)
        ctx.drawPath(using: .fill)
        ctx.translateBy(x: -startX, y: -startY)
    }
        
    func drawMouth(ctx: CGContext, width: Int, height: Int, startX: CGFloat, startY: CGFloat, color: CGColor) {
        let mouth = CGRect(x: 0, y: 0, width: width, height: height)
            
        ctx.setFillColor(color)

        ctx.translateBy(x: startX, y: startY)
        ctx.addEllipse(in: mouth)
        ctx.drawPath(using: .fill)
        ctx.translateBy(x: -startX, y: -startY)
    }
    
    func pointOnCircle(radius: CGFloat, angle: CGFloat) -> CGPoint {
        return CGPoint(x: radius * sin(angle), y: radius * cos(angle))
    }
    
    func drawTwinText() {
        let imgWidth = 512
        let imgHeight = 512
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: imgWidth, height: imgHeight))

        let height = 150
        let spacing = 40

        let top: Int = (imgHeight - height) / 2
        let bottom = top + height
                
        let width: Int = height * 2 / 3
                
        var startx = (imgWidth - (width + spacing + width + spacing + spacing + width)) / 2
                
        let image = renderer.image { ctx in
        drawT(ctx: ctx.cgContext, top: top, bottom: bottom, startx: startx, width: width)

        startx += width + spacing
        drawW(ctx: ctx.cgContext, top: top, bottom: bottom, startx: startx, width: width)

        startx += width + spacing
        drawI(ctx: ctx.cgContext, top: top, bottom: bottom, startx: startx, width: width)

        startx += spacing
        drawN(ctx: ctx.cgContext, top: top, bottom: bottom, startx: startx, width: width)

        ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
        ctx.cgContext.setLineWidth(10)
        ctx.cgContext.setLineJoin(.round)
        ctx.cgContext.setLineCap(.round)
        ctx.cgContext.drawPath(using: .stroke)
    }

    imageView.image = image
        
    }
    
    func drawT(ctx: CGContext, top: Int, bottom: Int, startx: Int, width: Int) {
        ctx.move(to: CGPoint(x: startx, y: top))
        ctx.addLine(to: CGPoint(x: startx + width, y: top))
        ctx.move(to: CGPoint(x: startx + width/2, y: top))
        ctx.addLine(to: CGPoint(x: startx + width/2, y: bottom))
    }
        
        
    func drawW(ctx: CGContext, top: Int, bottom: Int, startx: Int, width: Int) {
        ctx.move(to: CGPoint(x: startx, y: top))
        ctx.addLine(to: CGPoint(x: Double(startx) + Double(width) * 0.3, y: Double(bottom)))
        ctx.addLine(to: CGPoint(x: Double(startx) + Double(width) * 0.5, y: Double((top + bottom) / 2)))
        ctx.addLine(to: CGPoint(x: Double(startx) + Double(width) * 0.7, y: Double(bottom)))
        ctx.addLine(to: CGPoint(x: startx + width, y: top))
    }

        
    func drawI(ctx: CGContext, top: Int, bottom: Int, startx: Int, width: Int) {
        ctx.move(to: CGPoint(x: startx, y: top))
        ctx.addLine(to: CGPoint(x: startx, y: bottom))
    }

        
    func drawN(ctx: CGContext, top: Int, bottom: Int, startx: Int, width: Int) {
        ctx.move(to: CGPoint(x: startx, y: bottom))
        ctx.addLine(to: CGPoint(x: startx, y: top))
        ctx.addLine(to: CGPoint(x: startx + width, y: bottom))
        ctx.addLine(to: CGPoint(x: startx + width, y: top))
    }
}

