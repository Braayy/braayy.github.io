enum Page {
  Home
  Projects
}

store Router {
  state page : Page = Page::Home

  fun setPage(page : Page) {
    next {
      page = page
    }
  }
}
