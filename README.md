# space_app

# space_animation

## 🚀🌌 Space App: Explore the Cosmos
- A Flutter app that lets users create, customize, and store their virtual space experiences with smooth animations and persistent data storage using SharedPreferences.

- This app provides an interactive and visually appealing experience for users to build their unique space environments, with user preferences saved locally to ensure persistence between sessions.
- 
## ✨ Features
- AnimatedContainer: Inside PlanetDetails, use AnimatedContainer as the main widget. It animates changes to its properties like width, height, and borderRadius based on _isLarge state.

- State Management: _PlanetDetailsState manages the _isLarge boolean state. Tapping on the container toggles _isLarge, triggering the animation due to setState().

- GestureDetector: Wraps the AnimatedContainer to detect taps and call _toggleSize to change _isLarge.

- Animation Properties: duration specifies how long the animation should take (1 second in this case), and curve defines the animation's speed curve (here, Curves.fastOutSlowIn for a smooth transition).
- 
## 🛠️ Technologies Used
**Flutter:** Framework for building the app’s UI and functionality.
**SharedPreferences:** For local storage, saving user settings and space configurations.
**Animations:** Used for enhancing user experience with smooth visual transitions.

## 📷 Screenshots
<p>
  <img src = "https://github.com/user-attachments/assets/0937133f-8400-4c10-bc89-eb6f037f4e5a" height = 25%  width=25%>
  <img src = "https://github.com/user-attachments/assets/cf52b7d9-aeeb-4b0e-9b52-f5a1952901d4" height = 25%  width=25%>
  
  <img src = "https://github.com/user-attachments/assets/eda132a0-2c0b-441f-98c5-c123036dea71" height = 25%  width=25%>
  <img src = "https://github.com/user-attachments/assets/c7587a4b-014b-4cc2-869d-317cdd1bcaab" height = 25%  width=25%>
</p>
<div>
   <video height="450" src="https://github.com/user-attachments/assets/36d0b170-9780-42eb-9d10-74d112e82454" />
</div>




