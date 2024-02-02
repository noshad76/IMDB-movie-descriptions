import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'terms_page_state.dart';

class TermsPageCubit extends Cubit<TermsPageState> {
  bool privacyPolicy = false;
  bool terms = false;

  TermsPageCubit() : super(TermsPageInitial());

  void toNextPage() async {
    if (privacyPolicy == true && terms == true) {
      emit(TermsPageLoading());
      // await Future.delayed(const Duration());
      emit(TermsPageCompeleted());
      debugPrint('compeleterd');
    } else {
      emit(TermsPageFaild());
      emit(TermsPageInitial());
    }
  }

  void togglePrivacy(bool value) {
    privacyPolicy = value;
    emit(TermsPagePrivacyUpdated(privacyPolicy));
  }

  void toggleTerms(bool value) {
    terms = value;
    emit(TermsPageTermsUpdated(terms));
  }
}
