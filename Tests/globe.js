document.addEventListener('DOMContentLoaded', () => {
    let scene, camera, renderer, globe, controls, mouse, raycaster;

    function init() 
    {
        scene = new THREE.Scene();
        
        camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
        camera.position.z = 5;

        renderer = new THREE.WebGLRenderer();
        renderer.setSize(window.innerWidth, window.innerHeight);
        document.getElementById('globe').appendChild(renderer.domElement);

        const loader = new THREE.TextureLoader();
        loader.load('http://localhost:8000/BlankMap-Equirectangular.png', function(texture) {
            const geometry = new THREE.SphereGeometry(2, 32, 32);
            const material = new THREE.MeshBasicMaterial({
                map: texture
            });
            globe = new THREE.Mesh(geometry, material);
            scene.add(globe);
        });

        controls = new THREE.OrbitControls(camera, renderer.domElement);
        controls.rotateSpeed = 0.2;
        controls.zoomSpeed = 0.5;
        controls.enablePan = false;
        controls.minDistance = 3;
        controls.maxDistance = 6;
        controls.enableDamping = true; // require controls.update() in render loop
        controls.dampingFactor = 0.05;
        controls.enableZoom = true;

        let mouse = new THREE.Vector2();
        let raycaster = new THREE.Raycaster();

        document.addEventListener('click', (event) => {
            if (event.button === 0) { // 0 is left click
                mouse.x = (event.clientX / window.innerWidth) * 2 - 1;
                mouse.y = -(event.clientY / window.innerHeight) * 2 + 1;
                checkIntersection();
            }
        });

        function checkIntersection() {
            raycaster.setFromCamera(mouse, camera);
        
            const intersects = raycaster.intersectObject(globe, true);
        
            if (intersects.length > 0) {
                const intersect = intersects[0];
                const point = intersect.point;
                const {lat, lon} = convertToLatLon(point);
                
                getCountryName(lat, lon);
                
                console.log(lat, lon);
            }
        }

        function convertToLatLon(point) {
            let radius = 2; // Radius of the globe - Remember to update!
            let lat = 90 - (Math.acos(point.y / radius)) * 180 / Math.PI;
            let lon = ((270 + (Math.atan2(point.x, point.z)) * 180 / Math.PI) % 360) -180;
            return { lat, lon };
        }

        function getCountryName(latitude, longitude) {
            const apiKey = 'AIzaSyBjhU9PtYOkhUApukwKDtyKmvvzx9KhW_A'; // Google Cloud Console API KEY
            const url = `https://maps.googleapis.com/maps/api/geocode/json?latlng=${latitude},${longitude}&key=${apiKey}`;
          
            fetch(url)
              .then(response => response.json())
              .then(data => {
                if (data.status === 'OK') {
                  const components = data.results[0].address_components;
                  const country = components.find(c => c.types.includes('country'));
                  console.log(country.long_name);
                } else {
                  console.log('Geocoding failed:', data.status);
                }
              })
              .catch(error => console.log('Error:', error));
          }

        function animate() {
            requestAnimationFrame(animate);
            controls.update();
            renderer.render(scene, camera);
        }
        animate();
    }
    init();
});
