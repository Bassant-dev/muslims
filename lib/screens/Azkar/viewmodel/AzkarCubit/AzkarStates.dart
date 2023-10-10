abstract class AzkarStates {}
class AzkarInitialState extends  AzkarStates{}



//Get moring
class GetMorningLoadingState extends   AzkarStates{}
class GetMorningSuccessState extends   AzkarStates
{

}
class GetMorningErrorState extends   AzkarStates
{
  String error;
  GetMorningErrorState(this.error);
}
//get evening
class GetEveningLoadingState extends   AzkarStates{}
class GetEveningSuccessState extends   AzkarStates
{

}
class GetEveningErrorState extends   AzkarStates
{
  String error;
  GetEveningErrorState(this.error);
}
///get post prayer
class GetPostprayerAzkarLoadingState extends   AzkarStates{}
class GetPostprayerAzkarSuccessState extends   AzkarStates
{

}
class GetPostprayerAzkarErrorState extends   AzkarStates
{
  String error;
  GetPostprayerAzkarErrorState(this.error);
}
