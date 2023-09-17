# StudySpace.io

## Purpose
The **StudySpace.io** application is designed to streamline and enhance the way users manage their daily schedules, access educational content, and maintain a secure login system. Whether you're a student, professional, or simply someone interested in learning new things, this versatile application has something to offer.

## Features
This application boasts several key features that cater to a wide range of user needs:

### 1. Calendar Management
- **Efficient Scheduling**: Create and manage appointments, called "Termins," effortlessly.
- **Date and Time**: Set precise dates and times for your appointments to stay organized.
- **Location Tracking**: Pinpoint the location of your appointments on an interactive map.

### 2. User Authentication
- **Secure Access**: Protect your personal data with robust user authentication.
- **Registration**: Easily create an account to access the application's features.

### 3. Database Integration
- **Data Persistence**: Store and access your appointments and user information securely.
- **Reliable Storage**: Utilize SQLite databases to ensure data integrity.

### 4. Science Facts
- **Continuous Learning**: Stay informed and entertained with a collection of intriguing scientific facts.
- **Diverse Content**: Discover facts spanning various scientific categories.
- **Randomized Facts**: Access a new scientific fact each time you open the application.

## Who Is This App For?
- **Students**: Manage class schedules, assignments, and exams efficiently.
- **Professionals**: Organize work meetings, deadlines, and business appointments.
- **Curiosity Seekers**: Explore a wealth of fascinating scientific facts on diverse topics.
- **Security-Conscious Users**: Ensure the safety of your personal data with secure authentication.

## Getting Started
To start benefiting from the **Project Name** application, simply follow these steps:
1. Clone this repository to your local device.
2. Ensure you have Flutter and Dart installed.
3. Run `flutter pub get` to install project dependencies.
4. Build and launch the application on your preferred device or emulator.

## Feedback and Contributions
We welcome feedback, bug reports, and contributions from the community. Feel free to open issues, suggest enhancements, or submit pull requests to help improve this application.

Thank you for choosing **Project Name** to simplify your scheduling, enhance your knowledge, and secure your data!

---

**Note:** Don't forget to replace "Project Name" in the header with the actual name of your project.

## Table of Contents
- [Controller](#controller)
- [Model](#model)
- [Widgets Overview](#widgets-overview)

---

## Controller

### TerminHelper Class
**Description**: A utility class for managing temporary Termin objects.

#### Properties
- `temp`: List<Termin>
    - Description: A temporary list to store Termin objects.
    - Type: List<Termin>

### TerminDatabaseHelper Class
**Description**: Manages the SQLite database for storing Termin data.

##### Constructor
- `TerminDatabaseHelper._privateConstructor()`
    - Description: Private constructor for the `TerminDatabaseHelper` class.
    - Type: Constructor

##### Properties
- `instance`: TerminDatabaseHelper
    - Description: Singleton instance of `TerminDatabaseHelper`.
    - Type: Static Property
- `_database`: Database?
    - Description: Private database instance.
    - Type: Private Property

##### Methods
- `get database async`
    - Description: Returns the database instance and initializes it if not already done.
    - Type: Future<Database>
- `_initDatabase() async`
    - Description: Initializes the database and creates tables if they don't exist.
    - Type: Future<Database>
- `_onCreate(Database db, int version) async`
    - Description: Callback for creating database tables.
    - Type: Future
- `getTermins() async`
    - Description: Retrieve a list of Termin objects from the database.
    - Type: Future<List<Termin>>
- `addTermin(Termin new_termin) async`
    - Description: Add a new Termin object to the database.
    - Type: Future<int>
- `updateTermin(Termin termin) async`
    - Description: Update an existing Termin object in the database.
    - Type: Future<int>

### User Class
**Description**: Represents a User with properties for user details.

#### Constructor
- `User({this.id, required this.user_name, required this.user_email, required this.user_pass})`
    - Description: Constructor for the `User` class.
    - Type: Constructor

#### Properties
- `id`: int?
    - Description: User ID.
    - Type: Property
- `user_name`: String
    - Description: User's name.
    - Type: Property
- `user_email`: String
    - Description: User's email address.
    - Type: Property
- `user_pass`: String
    - Description: User's password.
    - Type: Property

#### Methods
- `fromMap(Map<String, dynamic> json)`
    - Description: Create a User object from a map.
    - Type: Factory Method
- `toMap()`
    - Description: Convert a User object to a map.
    - Type: Method

### DatabaseHelper Class
**Description**: Manages the SQLite database for storing User data.

##### Constructor
- `DatabaseHelper._privateConstructor()`
    - Description: Private constructor for the `DatabaseHelper` class.
    - Type: Constructor

##### Properties
- `instance`: DatabaseHelper
    - Description: Singleton instance of `DatabaseHelper`.
    - Type: Static Property
- `_database`: Database?
    - Description: Private database instance.
    - Type: Private Property

##### Methods
- `get database async`
    - Description: Returns the database instance and initializes it if not already done.
    - Type: Future<Database>
- `_initDatabase() async`
    - Description: Initializes the database and creates tables if they don't exist.
    - Type: Future<Database>
- `_onCreate(Database db, int version) async`
    - Description: Callback for creating database tables.
    - Type: Future
- `getUsers() async`
    - Description: Retrieve a list of User objects from the database.
    - Type: Future<List<User>>
- `add(User user) async`
    - Description: Add a new User object to the database.
    - Type: Future<int>
- `update(User user) async`
    - Description: Update an existing User object in the database.
    - Type: Future<int>

---

## Model

### Course Class
**Description**: Represents a Course with properties for course details.

#### Constructor
- `Course(int id, this.course_name, this.termin_date)`
    - Description: Constructor for the `Course` class.
    - Type: Constructor

#### Properties
- `course_id`: int
    - Description: Course ID.
    - Type: Property
- `course_name`: String
    - Description: Course name.
    - Type: Property
- `termin_date`: DateTime
    - Description: Date associated with the course.
    - Type: Property

#### Methods
- `toString()`
    - Description: Convert the Course object to a string representation.
    - Type: Method

### MyEvent Class
**Description**: Represents an event on a calendar with properties for event details.

#### Constructor
- `MyEvent({required this.termin, required this.c})`
    - Description: Constructor for the `MyEvent` class.
    - Type: Constructor

#### Properties
- `termin`: Termin
    - Description: Termin associated with the event.
    - Type: Property
- `c`: Color
    - Description: Color associated with the event.
    - Type: Property

### MyEventDataSource Class
**Description**: Provides data for a calendar view with methods to retrieve event information.

#### Constructor
- `MyEventDataSource(List<MyEvent> source)`
    - Description: Constructor for the `MyEventDataSource` class.
    - Type: Constructor

#### Methods
- `getStartTime(int index)`
    - Description: Get the start time of an event.
    - Type: Method
- `getEndTime(int index)`
    - Description: Get the end time of an event.
    - Type: Method
- `getSubject(int index)`
    - Description: Get the subject of an event.
    - Type: Method
- `getColor(int index)`
    - Description: Get the color associated with an event.
    - Type: Method

### ScienceFact Class
**Description**: Represents a scientific fact with properties for fact details.

#### Constructor
- `ScienceFact({required this.fact, required this.type, required this.category, required this.date, required this.number, required this.related})`
    - Description: Constructor for the `ScienceFact` class.
    - Type: Constructor

#### Properties
- `fact`: String
    - Description: The scientific fact.
    - Type: Property
- `type`: String
    - Description: The type of scientific fact.
    - Type: Property
- `category`: String
    - Description: The category of the scientific fact.
    - Type: Property
- `date`: String
    - Description: The date associated with the fact.
    - Type: Property
- `number`: String
    - Description: A numerical identifier for the fact.
    - Type: Property
- `related`: String
    - Description: Related information or text.
    - Type: Property

### Termin Class
**Description**: Represents a Termin with properties for termin details.

#### Constructor
- `Termin({this.id, required this.course_name, required this.termin_date, this.latitude, this.longitude, required this.created_by})`
    - Description: Constructor for the `Termin` class.
    - Type: Constructor

#### Properties
- `id`: int?
    - Description: Termin ID.
    - Type: Property
- `course_name`: String
    - Description: Course name associated with the Termin.
    - Type: Property
- `termin_date`: String
    - Description: Date and time of the Termin.
    - Type: Property
- `created_by`: int
    - Description: User ID of the creator.
    - Type: Property
- `latitude`: double?
    - Description: Latitude coordinate of the location.
    - Type: Property
- `longitude`: double?
    - Description: Longitude coordinate of the location.
    - Type: Property

#### Methods
- `fromMap(Map<String, dynamic> json)`
    - Description: Create a Termin object from a map.
    - Type: Factory Method
- `toMap()`
    - Description: Convert a Termin object to a map.
    - Type: Method
- `toString()`
    - Description: Convert the Termin object to a string representation.
    - Type: Method
#### Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  intl: ^0.18.0
  syncfusion_flutter_calendar: ^20.4.52
  sqflite: ^2.2.5
  path_provider: ^2.0.13
  google_maps_flutter: ^2.4.0
  http: ^0.13.3
  camera: ^0.10.5+4
```
## Widgets-Overview

### NewCourseTermin

- `NewCourseTermin` is a StatefulWidget responsible for creating a new course appointment.
- It includes form fields for entering the course name, date, and time.
- The user can also select a location on a Google Map for the appointment.

### LoginAuth

- `LoginAuth` is a StatefulWidget that manages user authentication.
- It decides whether to show the main application screen (`MyHomePage`) if the user is logged in or the login screen (`Login`) if not.

### MyCalendar

- `MyCalendar` is a StatelessWidget used for displaying a calendar of events.
- It uses the Syncfusion Flutter Calendar package to display events.

### DisplayPictureScreen

- `DisplayPictureScreen` is a StatelessWidget that displays a captured picture using the camera.
- It receives an image path as a parameter and shows the image.

### MyHomePage

- `MyHomePage` is a StatefulWidget representing the main application screen.
- It includes options for navigating to other screens, such as the calendar and the ability to create new appointments.

### Login

- `Login` is a StatefulWidget for handling user login.
- It provides text fields for entering email and password and allows users to log in.

### MyApp

- `MyApp` is the root widget of the application.
- It defines routes and sets up the main theme for the entire app.

### testdb

- `testdb` is a StatefulWidget for testing database functionality.
- It displays a list of user names retrieved from a local database and allows adding new users.

### RandomFactPage

- `RandomFactPage` is a StatefulWidget for displaying random science facts.
- It fetches data from an external API and displays the fetched fact.

### TakePictureScreen

- `TakePictureScreen` is a StatefulWidget for taking pictures using the device's camera.
- It allows users to take a picture and displays the captured image.

### TerminWidget

- `TerminWidget` is a StatefulWidget for displaying a list of event terminations.
- It shows a list of course names and their dates, and users can tap on an item to view its location on a map.

These widgets collectively make up the user interface and functionality of the application, handling various aspects such as authentication, database operations, event creation, and data display.
