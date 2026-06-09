### 📝 Update Notes (v0.0.5)

**🎮 Hardware Compatibility Improvements**
* **Extended Support for PS5 and Pro Controllers:** We have greatly improved the detection and compatibility with third-party controllers. The system now natively recognizes models such as **DualSense Edge, Razer, Nacon, Scuf, Victrix**, and others.

* **Developer Note:** Although the integration has been rewritten to be much more robust, due to the large number of third-party models, there may still be some isolated bugs. **We are very attentive to your feedback!** If you notice any issues with your controller, please let us know so we can fix them in the next patch.

**🤖 New Aim Dynamics and Prediction System**
* **Target Prediction:** A new predictive module that calculates where the target will move. It includes advanced settings for Prediction Frames, Prediction Gradual Appearance Range, Alpha Speed, and Smart Aiming Force for complete control over shot anticipation.

* **Lock Smoothing & Damping:** The way the system moves the camera has been rewritten. With the new Lock Smoothing and Damping, jerky movements and shakiness disappear, resulting in much smoother, more human-like tracking.

* **Lock Grace Frames:** If your target hides behind an obstacle for a fraction of a second, the system will maintain lock-on for a specified number of frames, preventing stuttering upon reappearance.

* **Maximum Detections:** You can now limit how many targets are processed on screen simultaneously to prioritize performance and prevent the camera from jumping around in areas with many players.


