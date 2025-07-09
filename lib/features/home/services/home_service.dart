
import '../models/match_model.dart';

class HomeService {
  List<MatchModel> getMatches() {
    // Mock data
    return [
      MatchModel(id: '1', teamA: 'Team A', teamB: 'Team B'),
      MatchModel(id: '2', teamA: 'Team C', teamB: 'Team D'),
      MatchModel(id: '3', teamA: 'Team E', teamB: 'Team F'),
    ];
  }
}
