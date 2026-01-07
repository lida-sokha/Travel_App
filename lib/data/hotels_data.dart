import '../models/hotel.dart';

final List<Hotel> hotelsData = [
  // ===== Phnom Penh (placeId: 1) =====
  Hotel(
    id: 1,
    placeId: 1,
    name: 'Plantation Urban Resort',
    address: '# 28 Street 184, Daun Penh, Phnom Penh, Cambodia',
    pricePerNight: 120,
    rating: 4.7,
    imageUrl: 'assets/images/hotels/plantation.jpg',
    bookingUrl: 'https://www.booking.com',
  ),
  Hotel(
    id: 2,
    placeId: 1,
    name: 'Okay Boutique Hotel',
    address: '# 174 Street 19, Sangkat Chey Chumneah, Phnom Penh, Cambodia',
    pricePerNight: 90,
    rating: 4.5,
    imageUrl: 'assets/images/hotels/okay_boutique.jpg',
    bookingUrl: 'https://www.agoda.com',
  ),

  // ===== Siem Reap (placeId: 2) =====
  Hotel(
    id: 3,
    placeId: 2,
    name: 'Golden Temple Residence',
    address: 'Sok San Road, Svay Dangkum, Siem Reap, Cambodia',
    pricePerNight: 130,
    rating: 4.8,
    imageUrl: 'assets/images/hotels/golden_temple.jpg',
    bookingUrl: 'https://www.booking.com',
  ),
  Hotel(
    id: 4,
    placeId: 2,
    name: 'Angkor Paradise Hotel',
    address: 'National Road No. 6, Phum Svay Dangkhum, Siem Reap, Cambodia',
    pricePerNight: 95,
    rating: 4.6,
    imageUrl: 'assets/images/hotels/angkor_paradise.jpg',
    bookingUrl: 'https://www.agoda.com',
  ),

  // ===== Battambang (placeId: 3) =====
  Hotel(
    id: 5,
    placeId: 3,
    name: 'Classy Hotel & Spa',
    address: 'Street 159D, Phum Romchek 4, Battambang, Cambodia',
    pricePerNight: 80,
    rating: 4.4,
    imageUrl: 'assets/images/hotels/classy_battambang.jpg',
    bookingUrl: 'https://www.booking.com',
  ),

  // ===== Kampot (placeId: 4) =====
  Hotel(
    id: 6,
    placeId: 4,
    name: 'Rikitikitavi Hotel',
    address: 'Riverside Road, Kampot Town, Kampot, Cambodia',
    pricePerNight: 75,
    rating: 4.6,
    imageUrl: 'assets/images/hotels/rikitikitavi.jpg',
    bookingUrl: 'https://www.agoda.com',
  ),
  Hotel(
    id: 7,
    placeId: 4,
    name: 'Bamboo Bungalows',
    address: 'Riverside West Bank, Kampot Town, Kampot, Cambodia',
    pricePerNight: 60,
    rating: 4.5,
    imageUrl: 'assets/images/hotels/bamboo_bungalows.jpg',
    bookingUrl: 'https://www.booking.com',
  ),

  // ===== Kep (placeId: 11) =====
  Hotel(
    id: 8,
    placeId: 8,
    name: 'Veranda Natural Resort',
    address: 'Kep Mountain Hillside, Kep Province, Cambodia',
    pricePerNight: 140,
    rating: 4.8,
    imageUrl: 'assets/images/hotels/veranda_kep.jpg',
    bookingUrl: 'https://www.booking.com',
  ),

  // ===== Sihanoukville (placeId: 12) =====
  Hotel(
    id: 9,
    placeId: 9,
    name: 'Independence Hotel Resort',
    address: 'Street 2 Thnou, Sangkat 3, Sihanoukville, Cambodia',
    pricePerNight: 160,
    rating: 4.6,
    imageUrl: 'assets/images/hotels/independence.jpg',
    bookingUrl: 'https://www.agoda.com',
  ),
  Hotel(
    id: 10,
    placeId: 9,
    name: 'Sokha Beach Resort',
    address: 'Street 2 Thnou, Sangkat 4, Sihanoukville, Cambodia',
    pricePerNight: 150,
    rating: 4.5,
    imageUrl: 'assets/images/hotels/sokha_beach.jpg',
    bookingUrl: 'https://www.booking.com',
  ),

  // ===== Koh Kong (placeId: 13) =====
  Hotel(
    id: 11,
    placeId: 13,
    name: 'Canvas & Orchids Retreat',
    address: 'Tatai River, Koh Kong Province, Cambodia',
    pricePerNight: 180,
    rating: 4.7,
    imageUrl: 'assets/images/hotels/canvas_orchids.jpg',
    bookingUrl: 'https://www.booking.com',
  ),

  // ===== Mondulkiri (placeId: 5) =====
  Hotel(
    id: 13,
    placeId: 5,
    name: 'Nature Lodge Mondulkiri',
    address:
        'Phum Meanchey, Sangkat Spean Mean Chey, Sen Monorom, Mondulkiri, Cambodia',
    pricePerNight: 70,
    rating: 4.6,
    imageUrl: 'assets/images/hotels/mondulkiri_lodge.jpg',
    bookingUrl: 'https://www.booking.com',
  ),

  // ===== Ratanakiri (placeId: 6) =====
  Hotel(
    id: 14,
    placeId: 6,
    name: 'Terres Rouges Lodge',
    address: 'Lake Kan Seng Road, Ban Lung, Ratanakiri, Cambodia',
    pricePerNight: 85,
    rating: 4.5,
    imageUrl: 'assets/images/hotels/terres_rouges.jpg',
    bookingUrl: 'https://www.agoda.com',
  ),

  // ===== Kratie (placeId: 7) =====
  Hotel(
    id: 15,
    placeId: 7,
    name: 'Le Relais de Chhlong',
    address: 'Street No. 7, Chhlong District, Kratie, Cambodia',
    pricePerNight: 95,
    rating: 4.7,
    imageUrl: 'assets/images/hotels/chhlong.jpg',
    bookingUrl: 'https://www.booking.com',
  ),

  // ===== Pailin (placeId: 10) =====
  Hotel(
    id: 18,
    placeId: 10,
    name: 'Memoria Palace & Resort',
    address: 'Phum Bor Yakha, Sangkat Bor Yakha, Pailin, Cambodia',
    pricePerNight: 70,
    rating: 4.3,
    imageUrl: 'assets/images/hotels/memoria_pailin.jpg',
    bookingUrl: 'https://www.agoda.com',
  ),
];
