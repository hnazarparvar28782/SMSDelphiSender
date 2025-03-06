SMS Sender with Delphi 7
Overview

This repository contains a Delphi 7 application designed for sending SMS messages via a SOAP web service. The user-friendly interface allows for easy input of mobile numbers and message content, with built-in validation and error handling to enhance the user experience.
Features

    User-Friendly Interface: Simple form for entering mobile numbers and message content.
    Input Validation: Ensures the mobile number is 11 digits and the message field is not empty.
    SOAP Web Service Integration: Utilizes a SOAP web service for sending SMS messages.
    Error Handling: Displays informative messages for any errors encountered during the sending process.

Technologies Used

    Programming Language: Delphi 7
    Framework: VCL (Visual Component Library)
    Web Service Protocol: SOAP
    XML: For request formatting to the SMS web service.

Installation

    Clone the Repository:

        bash
        

    git clone https://github.com/yourusername/sms-sender-delphi7.git

    Open the Project:
        Launch Delphi 7.
        Open the project file (.dpr) located in the cloned repository.

    Set Up the SOAP Web Service:
        Ensure you have access to a SOAP web service that supports SMS sending.
        Update the userid and password fields in the Button1Click method of sendformunit.pas with your service credentials.

    Compile and Run:
        Compile the project in Delphi 7.
        Run the application and enter a mobile number and message to send an SMS.

Usage

    Enter a valid 11-digit mobile number in the designated field.
    Type your message in the message text box.
    Click the “Send” button to transmit your SMS.
    If any errors occur, appropriate messages will be displayed.

Contributing

Contributions are welcome! If you have suggestions for improvements or features, feel free to open an issue or submit a pull request.
License

This project is licensed under the MIT License - see the LICENSE file for details.
Acknowledgments

    Thanks to the developers of Delphi and the SOAP web service for providing the tools needed to create this application.
    Special thanks to the open-source community for their continuous support and resources.
