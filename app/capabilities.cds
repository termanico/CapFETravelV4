using {TravelService} from '../srv/travel-service';

annotate TravelService.Travel with @odata.draft.enabled;
//Exercise 3.2: Add Semantic key
annotate TravelService.Travel with @Common.SemanticKey : [TravelID];

//Exercise 6: Add Aggregation Capabilities
