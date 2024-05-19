'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "b100a682548682cd01688958198e1a4a",
"version.json": "e7ec8a641014944a8f8579f990c20a00",
"index.html": "88cbfc273f7e74aa7feb1ceb1903e16c",
"/": "88cbfc273f7e74aa7feb1ceb1903e16c",
"main.dart.js": "2eba9128730e755e14cc87ef7b2e724a",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "afb0b5653d0e4090cdf43f9efc150682",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"metaimg.jpg": "2fa3613e70a9fd85634645640db4088d",
"assets/AssetManifest.json": "d9afa1687867d6d1924850c30d2b5310",
"assets/NOTICES": "f1d5ea825434cda18b96a66d171bc2e8",
"assets/FontManifest.json": "39bdcece20f79518c65c45e25bbfee99",
"assets/AssetManifest.bin.json": "e4dd6c60ed83c51811cc50793998715c",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "833bf561a7045af36136f08b95c90eb9",
"assets/fonts/MaterialIcons-Regular.otf": "8c92472b32ff5d8c6b37242c8a84c98c",
"assets/assets/images/15.webp": "ca13310db24ed0eccc0d1d0b0d614b79",
"assets/assets/images/5.webp": "febb075fcc65af97adc9155963b1347b",
"assets/assets/images/country.webp": "416be4d1b35d4250f871a670d1ab690b",
"assets/assets/images/9.webp": "88f5f7637398b2a925ca874fe8049b06",
"assets/assets/images/8.webp": "c133e3b0bb578d676f5a986ec2f4f237",
"assets/assets/images/db_cover.png": "b11dc4137781b280a3e20c6363d31f8d",
"assets/assets/images/dsc.webp": "2a60346e1e75a0b9379ac971f086d8cf",
"assets/assets/images/8.png": "112239e5bf766e25d4ec24934a9f4264",
"assets/assets/images/4.webp": "eb780b3a44a41a97bc5541d9493b92de",
"assets/assets/images/14.webp": "51abdd25b3984003b787da170fd91390",
"assets/assets/images/9.png": "099c9b284db9a61c20cebbfd67878fe0",
"assets/assets/images/yodha.webp": "c0b202a83ff155dbd8f324dedeb54b1e",
"assets/assets/images/14.png": "610520454b3e14531cab49716f99ecd1",
"assets/assets/images/country.png": "4058b552ed710c856dbd46915a9abc61",
"assets/assets/images/tak.webp": "c356baa416b780a3a66d9b17be102e7e",
"assets/assets/images/15.png": "ac4fb0ce9619a293db4fe4ac0089b8f2",
"assets/assets/images/3.webp": "4e03f34319e564ac296f21a5c1968fd5",
"assets/assets/images/12.png": "f7f90ca12c474b2e1c58466ad09abaa3",
"assets/assets/images/2.webp": "e5a80290da713e294a8a0223bb8d98fc",
"assets/assets/images/12.webp": "81c2c398b6228343cc506ad473479b27",
"assets/assets/images/13.png": "cece34f4680f38681da4cd1fdb8f1248",
"assets/assets/images/flutter_translator.webp": "643b8e4d7a048746d43f07cb7a06b573",
"assets/assets/images/11.png": "0f6cd554b17d59c9b63f18e44792e842",
"assets/assets/images/10.png": "d6d70b1db8a17886cd72a3eb4064066e",
"assets/assets/images/dsc.png": "1866109e9fb58d99f8de303e96c6db06",
"assets/assets/images/astrotak.webp": "c1e5eceafd2c59745831a5a900eda93d",
"assets/assets/images/yodha.png": "da0f817881f74f3c29176a0a891c74f9",
"assets/assets/images/1.webp": "c7f4f886eb99e626b6e90205d04ebd7a",
"assets/assets/images/11.webp": "c687773f3acd4f75b3ccb25bcb9f3261",
"assets/assets/images/flutter_translator.png": "9b215ef64e42c15e7a7820ad2112ef0d",
"assets/assets/images/10.webp": "4722edda2a519bf83a78520874039b9a",
"assets/assets/images/4.png": "791bbed5c218be5ed6002a98c882635a",
"assets/assets/images/7.webp": "ff91e34130b5cc876eb6ffccb7242eea",
"assets/assets/images/5.png": "24dbe9bbb1a40562f66cc608646450b9",
"assets/assets/images/7.png": "467b29172d9140f7c68a72718014eb20",
"assets/assets/images/6.png": "8d8df3145aab454059e7e6a7f0e41bb0",
"assets/assets/images/2.png": "f56fafc45ef9194d805fe464d01dceb4",
"assets/assets/images/db_cover.webp": "27fdecc441cb59e31db49ef933339e24",
"assets/assets/images/3.png": "288db31e632a461dac0698f4b3fa3012",
"assets/assets/images/1.png": "1b2138eda21e8ebb723cbea1b5099ead",
"assets/assets/images/lallantop.webp": "045a00cd072e55565912ace257bcb866",
"assets/assets/images/6.webp": "3983671b622bc856611cc908ac7c91f8",
"assets/assets/icons/medium.svg": "6c7fea6531eb8450d8bc54f9d642d6d3",
"assets/assets/icons/contact.svg": "bb77b0b1f8236fdaf77f773099ab5b52",
"assets/assets/icons/pub.svg": "fe180da932bdb8fe3210cab9098f43ab",
"assets/assets/icons/github.svg": "ba679906e271d70b0c6c0f2460e8d2e5",
"assets/assets/icons/code.svg": "7e4ab22bd7606324b98fb714c17826e8",
"assets/assets/icons/linkedin.svg": "84c69532bac5e1166593c9c9fc162142",
"assets/assets/icons/twitter.svg": "64c341fa98a5b20598ee33d2a7f3d8c4",
"assets/assets/icons/db.svg": "3cfc8fb2b8fdb1d7a306af275d0652b0",
"assets/assets/icons/menu.svg": "8659515094d85059439811bbedcbbc39",
"assets/assets/fonts/RobotoCondensed-Bold.ttf": "e38804ae070b58fbf4fdd88fd6853929",
"assets/assets/fonts/RobotoCondensed-Light.ttf": "905c2728284a6b881d4e417b80f1e79d",
"assets/assets/fonts/RobotoCondensed-Regular.ttf": "0134dd8fe6fe708de73909a71d842780",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
