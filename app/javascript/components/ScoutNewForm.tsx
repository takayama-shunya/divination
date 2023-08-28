import React, { useState } from "react";
import { DatePicker } from "../components/DatePicker";
import { Box } from "@chakra-ui/react";

export default function Home() {
  const [startDate, setStartDate] = useState(new Date());

  return (
    <Box w="250px" mt="30px" ml="30px">
      <DatePicker
        selected={startDate}
        onChange={(date) => setStartDate(date)}
        dateFormat="yyyy/MM/dd"
        calendarStartDay={1}
      />
    </Box>
  );
}
