//
// See the LICENSE.txt file for this sample’s licensing information.
//
// Abstract:
// A entities and extensions to define the style.

import SwiftUI

// MARK: - Colors

extension Color
{
  public static let premiumBirdFood = Color(.premiumBirdFood)
}

extension ShapeStyle where Self == Color
{
  public static var premiumBirdFood: Color { .premiumBirdFood }
}

// MARK: - VibrantShapeStyle

public struct VibrantShapeStyle: ShapeStyle
{
  var opacity: Double

  public init(opacity: Double)
  {
    self.opacity = opacity
  }

  public func resolve(in environment: EnvironmentValues) -> some ShapeStyle
  {
    let startingStyle = {
      switch environment.colorScheme
      {
        case .light: return Color.black
        case .dark: return Color.white
        @unknown default: return Color.black
      }
    }()
    return startingStyle.opacity(opacity).vibrantlyBlended
  }
}

extension ShapeStyle where Self == VibrantShapeStyle
{
  public static func vibrant(opacity: Double) -> Self
  {
    .init(opacity: opacity)
  }
}

// MARK: - VibrantlyBlendedShapeStyle

public struct VibrantlyBlendedShapeStyle: ShapeStyle
{
  var base: AnyShapeStyle

  public init(base: AnyShapeStyle)
  {
    self.base = base
  }

  public func resolve(in environment: EnvironmentValues) -> some ShapeStyle
  {
    switch environment.colorScheme
    {
      case .light:
        return base.blendMode(.plusDarker)
      case .dark:
        return base.blendMode(.plusLighter)
      @unknown default:
        fatalError()
    }
  }
}

extension ShapeStyle
{
  public var vibrantlyBlended: VibrantlyBlendedShapeStyle
  {
    .init(base: AnyShapeStyle(self))
  }
}
