'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "5d37e7ea9263d2a3c1a4e1665fe54280",
"version.json": "eb4977dfb870a20256d62c98ff982b71",
"index.html": "4a90225493abfa36b5c570846cee8660",
"/": "4a90225493abfa36b5c570846cee8660",
"main.dart.js": "bb45216ecfa2d272654db29c665fc7cd",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "9320efab266fde45dcbc722351bacbda",
"icons/icon-16.png": "965ec8b2ecbc8236e93a3a6f29ed5e92",
"icons/Icon-maskable-512.png": "2a469c0b6eb6eff5085754cb1cd15cc6",
"icons/icon-32.png": "3f4ed091e8abae4919d489ccb3676948",
"icons/Icon-512.png": "2a469c0b6eb6eff5085754cb1cd15cc6",
"manifest.json": "49e6fd30a46e18571e58b84df880fae3",
".git/config": "e5ec173d979543db8a9f0054ea5de2ce",
".git/objects/95/be5feb5795d13abb6592c3bad3bc45347a1d1b": "6b1e66b12272afd0210962789c30b312",
".git/objects/68/dc59c3de8f4cfb3b7280c96188522c7297eafc": "0de9c94a1ba9504ad545ab0646366410",
".git/objects/3b/73e3875259b1b27082510714e1b3a47d396c3a": "dcca007bce3f478854ff3ab80e461aac",
".git/objects/9e/6cd71b903128aa0c82e2555b764d857bd4e133": "a5c92dc357e263a0974b1f29bab57c6d",
".git/objects/9e/ed56bf6bd47d011d388a7a125db60e748b832c": "4623177395a2ec52b46d63021e68d59c",
".git/objects/32/aa3cae58a7432051fc105cc91fca4d95d1d011": "4f8558ca16d04c4f28116d3292ae263d",
".git/objects/3d/d7ab1a9934a4a4698387f5e13f8ff0d37274fc": "0ecc7d87b858565940f9a34777da9fc2",
".git/objects/93/c1db9d41ac1c6fbaeef0ffb3c79b35a34e0558": "688d8d1ccd29f17c51bd565d1c1c2994",
".git/objects/9d/873b68a9f517b11077d9e652f67b2ef8b01728": "599295d0087ad087b51110deaac58552",
".git/objects/d9/23c911de16f9abfe250f080db4a9aaffdb425f": "a5c7b2c48f72511718c3816fd9d02e0d",
".git/objects/d0/23371979cf1e985205df19078051c10de0a82d": "700b71074bad7afee32068791dec7442",
".git/objects/d0/64f417d35f60fbaea417476487ecb9d357ea7d": "8db6208349975d46b1b4c35ce192274a",
".git/objects/da/fd65422747502c19b5c74b4230282644d2169c": "d8a62caf99a372ff6c7692e143787ce3",
".git/objects/a5/95d1cef2ce234e90200c76f3b9a6f4035ab88c": "2dade546eb9eade0cfbc2971a17a6022",
".git/objects/a5/dbb3304742c2359b4dc20d92665c10d22db723": "5e81c2a948040ee3dd8a1518c26fe9e6",
".git/objects/bd/b44fdefa15de12c5d75ce7f5ffe8d3df73991b": "85cf9d52124a39781b5e7c6182fc4e9d",
".git/objects/e5/63742b862daad874db5b5eec4eb715bb2100c9": "c1607a81d867bd48fc5334406f8042ff",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f2/a620d723290bb53c8654b634a07329d715d321": "d6f7d13aac87427101d19fa430365c86",
".git/objects/ca/6438c9e48dc324b28139a120141ce314ee2d80": "4ceeca609e466e96bfcd193d814a60ba",
".git/objects/e4/d57f4a03ee4fd37523d5e1c5b23a366e523d7d": "1137f43730c811265a54398cc6f2bb47",
".git/objects/fb/c58cfe5c255e9743db423dce2d15501c27893f": "d23e276e4d54e064f863bd1305eedd7a",
".git/objects/c6/897d6802711e55599efa0f1502418071a1ebaa": "7a7fde1bddccff2490c5aa1829091acb",
".git/objects/4b/a054c012b65f5f396a3a111032c575879cb0bc": "c4350aa2695b513048ac176624a63490",
".git/objects/pack/pack-28e663f47f183cb837fc0f07b7c1f4303d3a989c.rev": "82bd8b8073b0a9ec8b5c4a63339a2332",
".git/objects/pack/pack-28e663f47f183cb837fc0f07b7c1f4303d3a989c.pack": "dcc132716096d7f05f3c725caa01e43c",
".git/objects/pack/pack-28e663f47f183cb837fc0f07b7c1f4303d3a989c.idx": "7b83e6b5f2db9271cb492819df35486d",
".git/objects/16/29404b81ed92eb848cdcbb6367a16f3ca0064d": "19710f6ba708b907c01ff3a7c61a5efa",
".git/objects/1f/3b30aada6af71e7999ca97c0006ddf5a1e4766": "8f3040f61dbb5f3e3e372f5932aa8aca",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/73/4a5eeb9e96a615895a6229a9e0816338521200": "72e1b61b4246b79e9e314cb98724cb08",
".git/objects/17/e19a62112dfd65fcf174c4bb2e40a4ddb6fbed": "2871d17f91e3876da0033985d3a25d65",
".git/objects/8f/17d4a4fcf8b2f145c23d81b367663967580259": "efd7db94557e5107148c63e92c74f757",
".git/objects/44/c6b6cda38a69e45a9a61b9d643ecde99c28199": "9c8a11be275a731258a94fa414868704",
".git/objects/44/a8b8e41b111fcf913a963e318b98e7f6976886": "5014fdb68f6b941b7c134a717a3a2bc6",
".git/objects/88/75b4040365ba6428fe9e5b621a2cd8aae6c142": "9bd7aa5127c70a5ea1725de01e58f83f",
".git/objects/6b/e909fbf40b23748412f0ea89bf0fae827ed976": "5f118419157d9534688915220cc803f7",
".git/objects/36/b40d272706c6df24df1d59675b2177548a57e8": "9bb0b3b96ec30a7e6262b2aa08590a93",
".git/objects/3a/7525f2996a1138fe67d2a0904bf5d214bfd22c": "ab6f2f6356cba61e57d5c10c2e18739d",
".git/objects/98/57c9b3b0448c92818efc5fda0f206b21914168": "ecbde07c564dabbec0f249821051b8af",
".git/objects/3f/5322e16cf81b869a2913361f3d53b41c46839c": "5aa494cdfa2fc28bfa92404f2f22eaad",
".git/objects/08/32d0db2def1613c1c45aa4fe9156a1c6b7d589": "e05df183e5eeaddf39672a2516f9c41d",
".git/objects/52/d52cb291c255ddb1416807e4602b33133b7b7c": "44416b4a38412476865bd1f50bdf6e73",
".git/objects/55/a5ba76672fdf6d597c8db939ed636a14d48759": "dfab32e6efefe385805c4dc4fb7ff306",
".git/objects/90/bcfcf0a77ab618a826db0fd8b0942963b653af": "fc109675cdf1233dd6599a4c3c0a7a69",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/a0/dc9c86e5e8447b6a74522045af2bf7676a252f": "5c945cce900b88443071156b3bb07e1e",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/b6/49b2e9380ec078e135b5e5722ded456ec7964b": "73e7e11ef764b0d58baa4a63748b9211",
".git/objects/aa/9c47d0c1c5c61303089570f368a295ca3e8168": "1a3963c4f6c982c8236c8745f1e2c07b",
".git/objects/af/c96ad93fbec1bdb99f3077297889e2901dbc75": "88116cf22dd376f8b46d4110c8153272",
".git/objects/b7/de3803c382542456fb8c2ed75a56dffce20a3b": "09d4d0163730d5273631124ea7aef36a",
".git/objects/db/7abcd87b155c1b0f21dc0b3df180044ac84cf4": "b3447f5fddd0c1abb44cc58cbb09f283",
".git/objects/e1/6df83ff5db10ad25d0c4f8cbc4911b99053e0e": "ea279d1d8baf61971333d90c0d3f9ea5",
".git/objects/f7/6bba405d85387a809e0e3c4d0fad72c88ee429": "82fb15a82357ecf9e6850109ae04e29f",
".git/objects/c2/ee90282d80d16c94d67b4d2ba7d1d265022f29": "b17dc368300351d2a95a629874b97a0a",
".git/objects/c2/bfe1f23b62a7158c8a6572ab8764c29ed9ed5d": "1cde672b02dfc9f086f8d5c15217ed60",
".git/objects/46/4adce1416915f36b5dfd76151937563f3e424f": "66dc2cb8696976c091a7fc360f8b4f64",
".git/objects/48/4c256b3e17efea334eb45dea9ba7c8f66be176": "bdc183ad1e66bcf111897ef0a72aa0f3",
".git/objects/84/0516208d35dcb4298847ab835e2ef84ada92fa": "36a4a870d8d9c1c623d8e1be329049da",
".git/objects/23/a3ed33ee096e1603e182af89e7e8dd92a6c9ef": "162a8120560dae148866087dfeaebb76",
".git/objects/15/db9f2f8c0321cb7ad1c8db1bd529c6723cd2ff": "a766e70eefc1c77e936f6827f42dbe9a",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/76/49feb7c41cf61328e345f7d79ad4adb50e619d": "efe1b1bcab3464125fdad17dde68e624",
".git/objects/40/6bcb6927ce46e2d11ff2acc8cc632da5589744": "18c306ded7f8ea7fcfe981c8642c69a3",
".git/objects/40/2fc9b7aaf0ce632c2de9c86f2dce4bee303c4e": "e86731bbdecaae93a19e3a38afca6525",
".git/objects/2e/5d657b528b02a54e0ae65354b3ac5d78dbde8d": "33388f2413e4fce3176e464ab751d910",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "e1e2af380332773c3181abf9d6e49198",
".git/logs/refs/heads/main": "38602d9d091ab5587d418346c3e2ace8",
".git/logs/refs/remotes/origin/add_category": "ad891b7ad8ab6e71a6989502f62a37c9",
".git/logs/refs/remotes/origin/master": "81c7cb1f6394e436cd8e243742c43088",
".git/logs/refs/remotes/origin/main": "b16c967122f56248425459963effab4a",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "94b6bce79bac5a7660d0c5881ac5cb6a",
".git/refs/remotes/origin/add_category": "ea6247c381fedb86b4c97b2d136a8315",
".git/refs/remotes/origin/master": "63f4f1f5d84e51cbdbb4d12e4e8060f8",
".git/refs/remotes/origin/main": "8b683aa4b857218241a605c41b48d33e",
".git/index": "b93535e61b05b080cc9420390a18ffd9",
".git/COMMIT_EDITMSG": "cf4ddb1f6126e9fe11254d04a1a7c79c",
".git/FETCH_HEAD": "5e4297242559b06f0d65f5a9c699fc69",
"assets/AssetManifest.json": "287e4567d21ef2b3ae987e292d5df97b",
"assets/NOTICES": "89b1b896b279134c74436d39fd4c2e45",
"assets/FontManifest.json": "bb31e4f8e817401207c679443f0669ec",
"assets/AssetManifest.bin.json": "314c1866277ef84528894a10a9df10c7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "b61a1e806d898db94d8c27e3a1b4f20a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "17ee8e30dde24e349e70ffcdc0073fb0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "694f695df1ec2a3bb52830b8200dea5c",
"assets/fonts/MaterialIcons-Regular.otf": "24b520f6fabb2aadb6da9aea000054bc",
"assets/assets/images/database.png": "3291559fb3079e9979efac68fb1fd5db",
"assets/assets/images/background.png": "ea90bd21e18eecd8baef342ba4732680",
"assets/assets/images/optimisation.png": "a9083ed93ea6ae43ff100a060219afeb",
"assets/assets/images/data.png": "e08f5d5ccdd153bd63b4d5a23de4fbb9",
"assets/assets/images/abreve.jpeg": "caf9bf1aebba622ba7c91c62745c58ea",
"assets/assets/images/IMG_0556.PNG": "70d24a93b043e1074d411da09f3942b3",
"assets/assets/fonts/BodoniModa-Italic-VariableFont_opsz,wght.ttf": "baf1951ce7449c744482ecd5d17b022d",
"assets/assets/fonts/BodoniModa-VariableFont_opsz,wght.ttf": "cef9125c763a35e9ad7585e316a1e286",
"assets/assets/animations/animation_ll26ggaq.json": "8f0d8ac3f5ad4787684a7bb15e642c81",
"assets/assets/animations/animation_ll3v9mj6.json": "85850f70762dbfbbed40ce7d27173abd",
"assets/assets/animations/Animation%2520-%25201716913099900.json": "f8649f2863e389bece2869b67cf25f66",
"assets/assets/animations/Animation%2520-%25201716910668576.json": "3834a4496acae7410fb5c03c0c89148e",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
