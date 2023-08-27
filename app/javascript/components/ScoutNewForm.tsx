import React from "react";
import { Box } from "@chakra-ui/react";
import { useState } from "react";
import DatePicker from "react-datepicker";

// import "/stylesheets/datepicker/react-datepicker.css";
// import "app/assets/stylesheets/datepicker/test.scss"

export default function Home() {
  const [startDate, setStartDate] = useState(new Date());

  return (
    <div>
      <p className="test-p">test</p>
      <Box w="250px" mt="30px" ml="30px">
        <DatePicker
          selected={startDate}
          onChange={(date) => setStartDate(date)}
        />
      </Box>
    </div>
  );
}