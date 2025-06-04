'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "9109b134cd3b9a477cbe662ee8f8a033",
"version.json": "eb4977dfb870a20256d62c98ff982b71",
"index.html": "fc3fa8e6e3715690269506a464ae0385",
"/": "fc3fa8e6e3715690269506a464ae0385",
"main.dart.js": "d1f72aede8ea55915ee0a76b51d9e842",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "49e6fd30a46e18571e58b84df880fae3",
".git/config": "cd180763c260397bbd186b8b8d5059d3",
".git/objects/95/be5feb5795d13abb6592c3bad3bc45347a1d1b": "6b1e66b12272afd0210962789c30b312",
".git/objects/57/7946daf6467a3f0a883583abfb8f1e57c86b54": "846aff8094feabe0db132052fd10f62a",
".git/objects/03/2fe904174b32b7135766696dd37e9a95c1b4fd": "80ba3eb567ab1b2327a13096a62dd17e",
".git/objects/35/96d08a5b8c249a9ff1eb36682aee2a23e61bac": "e931dda039902c600d4ba7d954ff090f",
".git/objects/3c/ddf31c8f6efa4f8bf433aa27656f4e1da00e06": "8764738d87b028ae515b40f0ab50200d",
".git/objects/93/c1db9d41ac1c6fbaeef0ffb3c79b35a34e0558": "688d8d1ccd29f17c51bd565d1c1c2994",
".git/objects/94/e0964e493da76d9d1c020a39b09564ec64518f": "b547e324cc2172450296b46d11fa56f9",
".git/objects/5f/bf1f5ee49ba64ffa8e24e19c0231e22add1631": "f19d414bb2afb15ab9eb762fd11311d6",
".git/objects/d9/3952e90f26e65356f31c60fc394efb26313167": "1401847c6f090e48e83740a00be1c303",
".git/objects/ad/284f69b01b23eb5c3ab01bd2e65768698b207a": "b2b5e78f71326145300aacb896d80b37",
".git/objects/d0/64f417d35f60fbaea417476487ecb9d357ea7d": "8db6208349975d46b1b4c35ce192274a",
".git/objects/a5/95d1cef2ce234e90200c76f3b9a6f4035ab88c": "2dade546eb9eade0cfbc2971a17a6022",
".git/objects/a5/de584f4d25ef8aace1c5a0c190c3b31639895b": "9fbbb0db1824af504c56e5d959e1cdff",
".git/objects/a5/dbb3304742c2359b4dc20d92665c10d22db723": "5e81c2a948040ee3dd8a1518c26fe9e6",
".git/objects/bd/6be43d015a2a8a92db341ee519feb383a20cb4": "0df4c80430aff6e9b0cdd970bc215545",
".git/objects/bd/b44fdefa15de12c5d75ce7f5ffe8d3df73991b": "85cf9d52124a39781b5e7c6182fc4e9d",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/f3/709a83aedf1f03d6e04459831b12355a9b9ef1": "538d2edfa707ca92ed0b867d6c3903d1",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/ca/6438c9e48dc324b28139a120141ce314ee2d80": "4ceeca609e466e96bfcd193d814a60ba",
".git/objects/e4/d187537fbb012d3bb5a01e46213761931727a0": "49bd2e6daf598de11459af49fe33cbff",
".git/objects/ec/20c2c02073ee1f102b0b930c583ab23b1ccdd1": "155967489be9b9a22c48febaaba68ad7",
".git/objects/4b/a054c012b65f5f396a3a111032c575879cb0bc": "c4350aa2695b513048ac176624a63490",
".git/objects/1f/3b30aada6af71e7999ca97c0006ddf5a1e4766": "8f3040f61dbb5f3e3e372f5932aa8aca",
".git/objects/73/4a5eeb9e96a615895a6229a9e0816338521200": "72e1b61b4246b79e9e314cb98724cb08",
".git/objects/8a/51a9b155d31c44b148d7e287fc2872e0cafd42": "9f785032380d7569e69b3d17172f64e8",
".git/objects/86/8a6c67d6dd307ec59fb3b56906f93a9dd2e6b2": "440a798e8a3cbfa9c70c5e299f3c90d1",
".git/objects/44/880c0f1441ee45f74f74a9b53a7c9eb775f0ee": "2c4b230f2362e202e119168e057c3b25",
".git/objects/44/c6b6cda38a69e45a9a61b9d643ecde99c28199": "9c8a11be275a731258a94fa414868704",
".git/objects/2a/e1f1818860a0d86db886190442253b375b1fae": "198c46253855292cd7777ba3903cea27",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/38/f72c3b661274731c0dca4263c6147292c3313e": "06ec909689545717240ec77454003efe",
".git/objects/9a/53c9c9d3d7379d91115e618ed6fdf043b0c77a": "25c5c02db63618ed34c6fd0e2b7fd23e",
".git/objects/36/b40d272706c6df24df1d59675b2177548a57e8": "9bb0b3b96ec30a7e6262b2aa08590a93",
".git/objects/91/4a40ccb508c126fa995820d01ea15c69bb95f7": "8963a99a625c47f6cd41ba314ebd2488",
".git/objects/3f/5322e16cf81b869a2913361f3d53b41c46839c": "5aa494cdfa2fc28bfa92404f2f22eaad",
".git/objects/5e/bf37944a56f2b5e479e3858392c6e9030da2da": "d874f5ce1eb6512c7b77ebd17b676f00",
".git/objects/52/d52cb291c255ddb1416807e4602b33133b7b7c": "44416b4a38412476865bd1f50bdf6e73",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/a0/d7dc120a4809da9899b1313666e0cba9e04f7b": "09ea2388cb9a7965fc774dce993a1dc4",
".git/objects/dc/f83695f71da8c6278eb914cdd42692c427924e": "9ca7f32e12839dea4610032ada023058",
".git/objects/aa/9c47d0c1c5c61303089570f368a295ca3e8168": "1a3963c4f6c982c8236c8745f1e2c07b",
".git/objects/af/c96ad93fbec1bdb99f3077297889e2901dbc75": "88116cf22dd376f8b46d4110c8153272",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b7/de3803c382542456fb8c2ed75a56dffce20a3b": "09d4d0163730d5273631124ea7aef36a",
".git/objects/a8/8c9340e408fca6e68e2d6cd8363dccc2bd8642": "11e9d76ebfeb0c92c8dff256819c0796",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ef/b875788e4094f6091d9caa43e35c77640aaf21": "27e32738aea45acd66b98d36fc9fc9e0",
".git/objects/f7/6bba405d85387a809e0e3c4d0fad72c88ee429": "82fb15a82357ecf9e6850109ae04e29f",
".git/objects/c2/bfe1f23b62a7158c8a6572ab8764c29ed9ed5d": "1cde672b02dfc9f086f8d5c15217ed60",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/f8/d7c94176bdb9761ad12d9876e81a9753011618": "dfba2d5bd210275f380ec285ba488596",
".git/objects/46/4adce1416915f36b5dfd76151937563f3e424f": "66dc2cb8696976c091a7fc360f8b4f64",
".git/objects/48/09b2996ab5e2d213a69eafbf44e16a2eecb642": "d77d41746e2e525d71a6b4c74b4eb718",
".git/objects/48/4c256b3e17efea334eb45dea9ba7c8f66be176": "bdc183ad1e66bcf111897ef0a72aa0f3",
".git/objects/23/a3ed33ee096e1603e182af89e7e8dd92a6c9ef": "162a8120560dae148866087dfeaebb76",
".git/objects/4f/02e9875cb698379e68a23ba5d25625e0e2e4bc": "254bc336602c9480c293f5f1c64bb4c7",
".git/objects/8c/64dc06e90413fd9ee2356ced9cf0d8bf83e608": "38b82f29a4daa84bbfc6fd384f6ed85c",
".git/objects/1d/6999bb20bc5e0c89d70a8c9574347b1880446a": "4191f6d5b9545259d0f4e733031e834d",
".git/objects/82/87fbb8c2e45c5ce7951cd0ca533c66a4b11e43": "1eb84647c6a8bf81a455df14ef2defda",
".git/objects/40/1184f2840fcfb39ffde5f2f82fe5957c37d6fa": "1ea653b99fd29cd15fcc068857a1dbb2",
".git/objects/8e/aacf0e6552a0cdea1429f614c818524f2d34f6": "7c27f22a23207153a8d3a3e6b21be860",
".git/HEAD": "2823893d1840eaf5c0ca3d9ab28914d6",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "49b89dd065fe5b18a8c21cfa4d205705",
".git/logs/refs/heads/add_cart": "49b89dd065fe5b18a8c21cfa4d205705",
".git/logs/refs/remotes/origin/add_cart": "39699cb0658e826035e099b8495b1e37",
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
".git/refs/heads/add_cart": "dc5a8c1abe9a447d58c3115aed3f9524",
".git/refs/remotes/origin/add_cart": "dc5a8c1abe9a447d58c3115aed3f9524",
".git/index": "e3b2fe9a08e642fbf941e21c904434b8",
".git/COMMIT_EDITMSG": "bb3f43ede0499060537edcb3e428f973",
"assets/AssetManifest.json": "287e4567d21ef2b3ae987e292d5df97b",
"assets/NOTICES": "a600147e65facd214eba6b8c958ae7cb",
"assets/FontManifest.json": "bb31e4f8e817401207c679443f0669ec",
"assets/AssetManifest.bin.json": "314c1866277ef84528894a10a9df10c7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "09546df5ebb1aa31f87d0a1c73dc0741",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "694f695df1ec2a3bb52830b8200dea5c",
"assets/fonts/MaterialIcons-Regular.otf": "54e5070381438a6c4062e994d7e9cc20",
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
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
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
