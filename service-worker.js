const CACHE = '73085fbd3f393175900c01c3720c3884c4b997851b93aaa7036c28b9f7953434'
const PRECACHE_URLS = [
  '/source/Main.mint',
  '/source/components/NavBar.mint',
  '/source/views/Home.mint',
  '/source/views/Projects.mint',
  '/source/Projects.mint',
  '/source/Router.mint',
  '/README.md',
  '/dist/icon-76x76.png',
  '/dist/icon-256x256.png',
  '/dist/icon-96x96.png',
  '/dist/icon-36x36.png',
  '/dist/index.js',
  '/dist/icon-180x180.png',
  '/dist/icon-512x512.png',
  '/dist/icon-32x32.png',
  '/dist/icon-57x57.png',
  '/dist/icon-48x48.png',
  '/dist/icon-128x128.png',
  '/dist/icon-16x16.png',
  '/dist/icon-152x152.png',
  '/dist/icon-72x72.png',
  '/dist/icon-196x196.png',
  '/dist/manifest.webmanifest',
  '/dist/icon-192x192.png',
  '/dist/external-stylesheets.css',
  '/dist/icon-144x144.png',
  '/dist/index.html',
  '/dist/icon-167x167.png',
  '/dist/icon-120x120.png',
  '/assets/head.html',
  '/assets/icons/discord.svg',
  '/assets/icons/github.svg',
  '/assets/icons/twitter.svg',
  '/assets/style.css',
  '/mint.json'
]

// On install precache all static resources
self.addEventListener('install', event => {
  event.waitUntil(
    caches
      .open(CACHE)
      .then(cache => {
        const promises =
          PRECACHE_URLS.map((url) =>
            cache
              .add(url)
              .catch(error => console.log(`Could not cache: ${url} - ${error}!`))
          )

        return Promise.all(promises)
      })
      .then(self.skipWaiting())
  )
})

// On activate remove all unused caches
self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return cacheNames.filter(cacheName => cacheName !== CACHE)
    }).then(cachesToDelete => {
      return Promise.all(cachesToDelete.map(cacheToDelete => {
        return caches.delete(cacheToDelete)
      }))
    }).then(() => self.clients.claim())
  )
})

self.addEventListener('fetch', event => {
  const url = event.request.url
  const origin = self.location.origin
  const isSameOrigin = url.startsWith(origin)

  let response = null

  // If we are on the same origin
  if (isSameOrigin) {
    // Resolve the path
    const path = url.slice(origin.length)

    // Try to get the response from the cache, and if not available
    // fall back to the "index.html" file.
    response =
      caches
        .match(event.request)
        .then(cachedResponse => cachedResponse || caches.match('/index.html'))
  } else {
    response = fetch(event.request)
  }

  event.respondWith(response)
})
