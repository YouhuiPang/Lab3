# Restaurant Reservation System

## Introduction
This Rails-based application is designed to facilitate restaurant reservations. It caters to both customers and restaurant owners by providing a platform to manage bookings, reviews, and restaurant profiles efficiently.

### Testing Reservations

To test the reservation system:

- **Pre-configured Restaurants**: The system only has two pre-configured restaurants with tables ready for reservations:
  - **Chez Panisse**:
    - Login: `1@1`
    - Password: `123456`
  - **Zino**:
    - Login: `2@1`
    - Password: `111111`
  - These accounts provide access to the restaurant management interface where you can view and manage reservations.

- **Creating Your Own Restaurant**: You can also create your own restaurant profile to test the reservation system. Ensure you:
  - Complete all required information for your restaurant.
  - Add tables to enable booking functionalities.

By following these guidelines, you can fully explore the features of the reservation system from restaurant manager's perspectives.

## Features
- **User Authentication**: Differentiate between customer and restaurant owner accounts.
- **Restaurant Profiles**: Owners can create and manage comprehensive profiles for their restaurants.
- **Search Functionality**: Users can search for restaurants by location, cuisine, or name.
- **Reservations**: Enables customers to make reservations directly on restaurant profiles.
- **Reviews**: Customers can leave reviews about their dining experiences.
- **Table Management**: Restaurants can manage the availability and status of their tables.
- **Account Management**: Users can manage their profiles and reservations. Restaurant owners can also manage restaurant details and bookings.

## Models
- **User**: Handles user information with distinct roles for customers and restaurant owners.
- **Restaurant**: Includes details like name, description, cuisine, and operational hours.
- **Reservation**: Tracks reservations, linking customers, tables, and specific times.
- **Review**: Allows customers to post reviews regarding their visits.
- **Table**: Represents individual tables within a restaurant, tracking their status relative to reservations.

## Prerequisites
- Ruby on Rails
- MySQL or PostgreSQL
