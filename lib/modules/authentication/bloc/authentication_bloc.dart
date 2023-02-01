// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pubmate_light/const/app_enums.dart';
import 'package:pubmate_light/const/firestore_collections.dart';
import 'package:pubmate_light/utils/email_validator.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  //------------------Variables and instances-----------------------------------------
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
//---------------------------Firebase instances----------------------------------------
  final _auth = FirebaseAuth.instance;
  final _firestore =
      FirebaseFirestore.instance.collection(FirestoreCollections.users);
  //-----------------------------------------------------------------------------------
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>(
      (event, emit) async {
        /*
      This code block handles logic for sign in
      It checks the email validity then calls firebase
      Upon success in login it returns LoginSuccessState
      Which then triggers navigation to home screen
      */
        if (event is StartLoginEvent) {
          try {
            if (EmailValidator.validate(emailController.text)) {
              /* Validator for password to make sure it is not
              empty string to prevent server calls.
              */
              if (passwordController.text.isNotEmpty) {
                //Implemented login logic here
                emit(AuthOperationInProgress());
                await _auth
                    .signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text)
                    .then(
                  (value) {
                    emit(LoginSuccessState());
                  },
                );
              } else {
                //Throws error state in case password is not valid.
                emit(LoginFailedState(AuthErrors.invalidPassword));
              }
              //----------------------------------------------------------
            } else {
              //Throws error state in case email is not valid.
              emit(LoginFailedState(AuthErrors.invalidEmail));
            }
            //----------------------------------------------------------
          } catch (e) {
            emit(LoginFailedState(e));
          }
        }
        /*
      This code block handles logic for sign up
      It checks the fields validity then calls firebase.
      Upon success in signup it returns SignupSuccessState
      Which then triggers navigation to home screen.
      */
        if (event is StartSignupEvent) {
          try {
            if (EmailValidator.validate(emailController.text)) {
              /* Validator for password to make sure it is not
              empty string to prevent server calls.
              */
              if (passwordController.text.isNotEmpty) {
                if (firstNameController.text.isNotEmpty) {
                  //----------------------------------------------------------
                  if (lastNameController.text.isNotEmpty) {
                    //Implemented signup logic here
                    emit(AuthOperationInProgress());
                    await _auth
                        .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text)
                        .then(
                      (value) async {
                        await _firestore.doc(value.user!.email).set({
                          "email": value.user!.email,
                          "firstName": firstNameController.text,
                          "lastName": lastNameController.text,
                          "uuid": value.user!.uid
                        }).then((value) {
                          emit(SignupSuccessState());
                        });
                      },
                    ).onError((error, stackTrace) {
                      emit(SignupFailedState(error?.toString() ?? ""));
                    });
                  } else {
                    //Throws error state in case last name is not valid.
                    emit(SignupFailedState(AuthErrors.invalidLastName));
                  }
                  //----------------------------------------------------------
                } else {
                  //Throws error state in case first name is not valid.
                  emit(SignupFailedState(AuthErrors.invalidFirstName));
                }
                //----------------------------------------------------------
              } else {
                //Throws error state in case password is not valid.
                emit(SignupFailedState(AuthErrors.invalidPassword));
              }
              //----------------------------------------------------------
            } else {
              //Throws error state in case email is not valid.
              emit(SignupFailedState(AuthErrors.invalidEmail));
            }
            //----------------------------------------------------------
          } catch (e) {
            emit(SignupFailedState(e));
          }
        }
        /*
        This event keeps track of whether the user is logged in.
        It handles the navigation initially to send user to home screen
        or login in based on currentUser prop in firebase auth
        */
        if (event is CheckCurrentUser) {
          if (_auth.currentUser != null) {
            emit(CurrentUserExistsState());
          } else {
            emit(AuthenticationInitial());
          }
        }
      },
    );
  }
}
