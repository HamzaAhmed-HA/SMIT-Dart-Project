import 'dart:io';

class Weather {
  late String city;
  late String description;
  late double temperature;
  late int humidity;
  late double windSpeed;

  Weather(this.city, this.description, this.temperature, this.humidity,
      this.windSpeed);

  @override
  String toString() {
    return 'Weather in $city: $description, Temperature: $temperature°C, Humidity: $humidity%, Wind Speed: $windSpeed m/s';
  }
}

class WeatherManagementSystem {
  List<dynamic> weatherData = [];

  void addWeatherData(String city, String description, double temperature,
      int humidity, double windSpeed) {
    Weather weather =
        Weather(city, description, temperature, humidity, windSpeed);
    weatherData.add(weather);
    print('Weather data added successfully.');
  }

  void viewWeatherData() {
    if (weatherData.isEmpty) {
      print('No weather data available.');
    } else {
      for (Weather weather in weatherData) {
        print(weather);
      }
    }
  }

  void removeWeatherData(city) {
    if (weatherData[city] != city) {
      print("no Data Available");
    } else {
      weatherData.removeWhere(
          (weather) => weather.city.toLowerCase() == city.toLowerCase());
      print('Weather data for $city removed successfully.');
    }
  }
}

void main() {
  WeatherManagementSystem weatherSystem = WeatherManagementSystem();

  while (true) {
    print('\nWeather Management System Menu:');
    print('1. Add Weather Data');
    print('2. View Weather Data');
    print('3. Remove Weather Data');
    print('4. Exit');
    stdout.write('Enter your choice (1-4): ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addWeatherData(weatherSystem);
        break;
      case '2':
        viewWeatherData(weatherSystem);
        break;
      case '3':
        removeWeatherData(weatherSystem);
        break;
      case '4':
        exit(0);
      // break;
      default:
        print('Invalid choice. Please enter a number between 1 and 4.');
    }
  }
}

void addWeatherData(WeatherManagementSystem weatherSystem) {
  stdout.write('Enter city: ');
  String city = stdin.readLineSync()!;

  stdout.write('Enter weather description: ');
  String description = stdin.readLineSync()!;

  stdout.write('Enter temperature (in Celsius): ');
  double temperature = double.parse(stdin.readLineSync()!);

  stdout.write('Enter humidity: ');
  int humidity = int.parse(stdin.readLineSync()!);

  stdout.write('Enter wind speed (in m/s): ');
  double windSpeed = double.parse(stdin.readLineSync()!);

  weatherSystem.addWeatherData(
      city, description, temperature, humidity, windSpeed);
}

void viewWeatherData(WeatherManagementSystem weatherSystem) {
  print('\nWeather Data:');
  weatherSystem.viewWeatherData();
}

void removeWeatherData(WeatherManagementSystem weatherSystem) {
  stdout.write('Enter city to remove: ');
  String city = stdin.readLineSync()!;
  weatherSystem.removeWeatherData(city);
}