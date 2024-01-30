part of 'terms_page_cubit.dart';

sealed class TermsPageState extends Equatable {
  const TermsPageState();

  @override
  List<Object> get props => [];
}

final class TermsPageInitial extends TermsPageState {}

final class TermsPageFaild extends TermsPageState {}

final class TermsPageLoading extends TermsPageState {}

final class TermsPageCompeleted extends TermsPageState {}

class TermsPagePrivacyUpdated extends TermsPageState {
  final bool privacyPolicy;

  const TermsPagePrivacyUpdated(this.privacyPolicy);

  @override
  List<Object> get props => [privacyPolicy];
}

class TermsPageTermsUpdated extends TermsPageState {
  final bool terms;

  const TermsPageTermsUpdated(this.terms);

  @override
  List<Object> get props => [terms];
}
