import Fluent
import Vapor

/// Example controller
struct ExampleController: RouteCollection {
	func boot(routes: any RoutesBuilder) throws {
		let baseRoutes = routes.grouped("example")

		baseRoutes.get(use: { try await self.index(req: $0) })
	}

	func index(req: Request) async throws -> View {
		return try await req.view.render("index", ["title": "Hello World!"])
	}
}
