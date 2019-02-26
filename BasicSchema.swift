import FrameInterface

enum SchemaProvider {
  static var layers: [String: Layer.Type] {
    return [
      Circle.layerType: Circle.self,
      Rectangle.layerType: Rectangle.self
    ]
  }
}
    
public struct Circle: Layer {  
	public static let layerType = "Circle"  

  public let center: Point
  public let radius: Double  
  public let color: Color  

  public func draw(
    inCanvas canvas: Canvas) 
  { 
  	let circlePath = canvas.Path()    
    circlePath.addCircle(      
    	center: Point(
        x: self.center.x * canvas.width,
        y: self.center.y * canvas.height),       
      radius: self.radius * min(canvas.width, canvas.height))    
    canvas.fill(      
    	path: circlePath,       
      color: self.color)        
  }
}

public struct Rectangle: Layer {  
	public static let layerType = "Rectangle" 

  public let left: Double
  public let top: Double  
  public let right: Double
  public let bottom: Double
  public let color: Color

  public func draw(
    inCanvas canvas: Canvas) 
  { 
  	let rectanglePath = canvas.Path()    
    rectanglePath.addRectangle( 
      left: self.left * canvas.width,
      top: self.top * canvas.height,
      right: self.right * canvas.width,
      bottom: self.bottom * canvas.height)
    canvas.fill(      
    	path: rectanglePath,       
      color: self.color)        
  }
}
