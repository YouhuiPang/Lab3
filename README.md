# Restaurant Reservation System

## Introduction
This Rails-based application is designed to facilitate restaurant reservations. It caters to both customers and restaurant owners by providing a platform to manage bookings, reviews, and restaurant profiles efficiently.

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
