package nn.ru.http.service;

import nn.ru.http.dao.FlightDao;
import nn.ru.http.dto.FlightDto;

import java.util.List;

import static java.util.stream.Collectors.toList;
public class FlightService {

    public static final FlightService INSTANCE = new FlightService();

    private final FlightDao flightDao = FlightDao.getInstance();

    private FlightService() {
    }

    public List<FlightDto> findAll() {
        return flightDao.findAll().stream()
                .map(flight -> FlightDto.builder()
                        .id(flight.getId())
                        .description(
                                """
                                            %s - %s - %s
                                        """.formatted(flight.getDepartureAirportCode(), flight.getArrivalAirportCode(), flight.getStatus())
                        )
                        .build()
                )
                 .collect(toList());
    }

    public static FlightService getInstance() {
        return INSTANCE;
    }
}
