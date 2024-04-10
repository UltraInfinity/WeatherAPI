// Function to handle errors
function handleErrors(errorMessage) {
    // Display error message on the page
    const errorDiv = document.createElement('div');
    errorDiv.classList.add('error');
    errorDiv.textContent = errorMessage;
    document.getElementById('weather-container').appendChild(errorDiv);

    // Change background image to indicate error
    const body = document.getElementById("weather-container");
    body.style.backgroundImage = "url('images/error-background.jpg')"; // Change to error background image
}

// Function to get weather data
function getWeather() {
    const locationInput = document.getElementById("location").value;

    // Perform Ajax call to Open Weather Map API
    fetch(`https://api.openweathermap.org/data/2.5/weather?q=${locationInput}&appid=9a49c1c7e49c3a7e176d949edb11c5f0&units=metric`)
        .then((response) => {
            if (!response.ok) {
                if (response.status === 404) {
                    throw new Error('Location not found. Please enter a valid location.');
                } else {
                    throw new Error('Error fetching weather data. Please try again later.');
                }
            }
            return response.json();
        })
        .then((data) => {
            // Remove any existing error messages
            const errorDiv = document.querySelector('.error');
            if (errorDiv) {
                errorDiv.remove();
                // Reset background color
                document.body.style.backgroundColor = '#fff';
            }

            // Display weather results
            displayWeatherResults(data);

            // Call PHP script to insert data into the database
            insertWeatherData(locationInput, data);

            // Call PHP script to retrieve and display previous results
            getWeatherHistory(locationInput);
        })
        .catch((error) => {
            console.error("Error:", error.message);
            // Handle and display error messages gracefully
            handleErrors(error.message);
        });
}



function displayWeatherResults(data) {
  const weatherResultsDiv = document.getElementById("weather-results");
  const weatherDescription = data.weather[0].description;
  console.log(data.weather[0].description);
  weatherResultsDiv.innerHTML = `<p>Temperature: ${data.main.temp} °C</p>
  <p>Description: <img src="http://openweathermap.org/img/wn/${data.weather[0].icon}.png" alt="Weather Icon"> ${data.weather[0].description}</p>`;
  // Apply conditional statements to change background image based on weather conditions
  updateBackgroundImage(weatherDescription);
}

function insertWeatherData(location, data) {
  // Perform Ajax call to PHP script (insert.php) to insert data into the database
  const xhr = new XMLHttpRequest();
  xhr.open("POST", "insert.php", true);
  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  xhr.send(
    `location=${location}&temperature=${data.main.temp}&weather=${data.weather[0].description}`
  );
}

function getWeatherHistory(location) {
  // Perform Ajax call to PHP script (history.php) to retrieve and display previous results
  const xhr = new XMLHttpRequest();
  xhr.open("GET", `history.php?location=${location}`, true);
  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
      const historyDiv = document.getElementById("history");
      historyDiv.innerHTML = xhr.responseText;
    }
  };
  xhr.send();
}
function updateBackgroundImage(weatherDescription) {
  const body = document.getElementById("weather-container");

  if (weatherDescription.includes("rain")) {
    body.style.backgroundImage =
      "url('images/Rainy_Weather_On_My_Village_(224889743).webp')";
  } else if (weatherDescription.includes("cloud")) {
    body.style.backgroundImage = "url('images/altocumulus.jpg')";
  } else if (weatherDescription.includes("clear")) {
    body.style.backgroundImage = "url('images/clearsky.webp')";
  } else if (weatherDescription.includes("haze")) {
    body.style.backgroundImage = "url('images/foggy-morning-street.webp')";
  } else if (weatherDescription.includes("snow")) {
    body.style.backgroundImage =
      "url('images/26holiday-weather01sub-superJumbo.webp')";
  } else {
    // Default background image for other conditions
    body.style.backgroundImage = "url('images/28.blue-sky-with-shiny-clouds-background_1017-23279.jpg')";
  }
}
