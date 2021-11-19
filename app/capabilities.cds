using {TravelService} from '../srv/travel-service';

annotate TravelService.Travel with @odata.draft.enabled;
//Exercise 3.2: Add Semantic key
annotate TravelService.Travel with @Common.SemanticKey : [TravelID];

//Exercise 6: Add Aggregation Capabilities
annotate TravelService.BookedFlights with @(
    Aggregation.ApplySupported     : {
        $Type                  : 'Aggregation.ApplySupportedType',
        Transformations        : [
            'aggregate',
            'groupby'
        ],
        Rollup                 : #None,
        GroupableProperties    : [
            to_Customer_CustomerID,
            AirlineID
        ],
        AggregatableProperties : [{
            $Type    : 'Aggregation.AggregatablePropertyType',
            Property : BookingUUID
        }, ],
    },
    Analytics.AggregatedProperties : [{
        Name                 : 'CountFlights',
        AggregationMethod    : 'countdistinct',
        AggregatableProperty : BookingUUID,
        ![@Common.Label]     : 'Booked Flights per Airline',
    }]
);
