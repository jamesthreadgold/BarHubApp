//
//  Map.swift
//  BarHub
//
//  Created by James Threadgold on 06/03/2024.
//
import SwiftUI
import MapKit

struct Map: View {
    @StateObject private var locationManager = LocationManager()
    @State private var annotations: [CustomAnnotation] = []
    @State private var showDetails = false
    
    // Define a custom annotation for "The Lazy Dog" pub
    let customAnnotation = CustomAnnotation(
        coordinate: CLLocationCoordinate2D(latitude: 51.483230, longitude: -2.582748),
        title: "The Lazy Dog",
        subtitle: nil
    )
    
    var body: some View {
        NavigationView {
            ZStack {
                // Display the map view with annotations and handle annotation tap events
                MapViewRepresentable(
                    locationManager: locationManager,
                    annotations: annotations + [customAnnotation],
                    showDetails: $showDetails,
                    onAnnotationTap: { annotation in
                        if annotation.title == "The Lazy Dog" {
                            showDetails = true
                        }
                    }
                )
                .ignoresSafeArea()
            }
        }
        .onAppear {
            // Request location permission and search for pubs when the view appears
            locationManager.requestLocationPermission()
            searchPubs()
        }
    }
    
    func searchPubs() {
        // Create a search request for pubs in the specified region
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "pubs"
        request.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.481230, longitude: -2.580748), latitudinalMeters: 5000, longitudinalMeters: 5000)
        
        // Perform the search and handle the response
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            // Create custom annotations for each search result
            let mapItems = response.mapItems
            let newAnnotations = mapItems.map { mapItem -> CustomAnnotation in
                let annotation = CustomAnnotation(coordinate: mapItem.placemark.coordinate, title: mapItem.name, subtitle: mapItem.phoneNumber)
                return annotation
            }
            
            // Update the annotations array with the new annotations
            annotations = newAnnotations
        }
    }
}

struct MapViewRepresentable: UIViewRepresentable {
    @ObservedObject var locationManager: LocationManager
    let annotations: [CustomAnnotation]
    @Binding var showDetails: Bool
    let onAnnotationTap: (CustomAnnotation) -> Void
    
    func makeUIView(context: Context) -> MKMapView {
        // Create and configure the map view
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.isZoomEnabled = true
        
        // Add annotations to the map view
        mapView.addAnnotations(annotations)
        
        // Set the map style to dark mode (if available)
        if #available(iOS 13.0, *) {
            mapView.overrideUserInterfaceStyle = .dark
        }
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        // Set the initial location and region for the map view
        let initialLocation = CLLocationCoordinate2D(latitude: 51.481230, longitude: -2.580748)
        let region = MKCoordinateRegion(center: initialLocation, latitudinalMeters: 5000, longitudinalMeters: 5000)
        view.setRegion(region, animated: true)
        
        // Remove existing annotations and add new annotations
        view.removeAnnotations(view.annotations)
        view.addAnnotations(annotations)
    }
    
    func makeCoordinator() -> Coordinator {
        // Create a coordinator to handle map view delegate methods
        Coordinator(self, onAnnotationTap: onAnnotationTap)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewRepresentable
        let onAnnotationTap: (CustomAnnotation) -> Void
        
        init(_ parent: MapViewRepresentable, onAnnotationTap: @escaping (CustomAnnotation) -> Void) {
            self.parent = parent
            self.onAnnotationTap = onAnnotationTap
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            // Customize the appearance of annotation views
            guard let customAnnotation = annotation as? CustomAnnotation else {
                return nil
            }
            
            let identifier = "CustomAnnotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: customAnnotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
            } else {
                annotationView?.annotation = customAnnotation
            }
            
            // Set the marker color
            if let markerAnnotationView = annotationView as? MKMarkerAnnotationView {
                markerAnnotationView.markerTintColor = UIColor(red: 105/255, green: 74/255, blue: 181/255, alpha: 1.0)
            }
            
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            // Handle annotation callout tap event
            guard let annotation = view.annotation as? CustomAnnotation else {
                return
            }
            onAnnotationTap(annotation)
        }
    }
}

struct DetailsView: View {
    let title: String
    
    var body: some View {
        // Display details for a tapped annotation
        Text("Details for \(title)")
            .navigationBarTitle(title)
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var lastLocation: CLLocation?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestLocationPermission() {
        // Request location permission from the user
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Update the last known location whenever new locations are received
        lastLocation = locations.last
    }
}

class CustomAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

#Preview {
    Map()
}
