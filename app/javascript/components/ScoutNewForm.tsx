import React, { useState } from "react";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod"; 
import { ScoutNewFormSchema, ScoutNewFormSchemaValidate } from "../components/validate/ScoutNewFormSchema";
import {
  Button, Checkbox, Container, FormControl, FormControlLabel, FormGroup, FormHelperText, FormLabel, InputLabel, MenuItem, NativeSelect, Radio, RadioGroup, Select, Stack, TextField
} from '@mui/material';
import dayjs, { Dayjs } from 'dayjs';
import { DemoContainer } from '@mui/x-date-pickers/internals/demo';
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
import { DatePicker } from '@mui/x-date-pickers/DatePicker';

type formType = {
  date: Date,
  place: number,
}




export default function ScoutNewForm() {
  
  const [value, setValue] = React.useState<Dayjs | null>(dayjs(new Date()));

  const { register, handleSubmit, formState: { errors } } = useForm<ScoutNewFormSchemaValidate>({
    resolver: zodResolver(ScoutNewFormSchema),
  });

  const onSubmit = (data: ScoutNewFormSchemaValidate) => {
    console.log(data);
  };

  // const { register, handleSubmit } = useForm<formType>()

  // const onSubmit = (data: formType) => {
  //   console.log(data)
  // }

  return (
    <Container maxWidth="sm">
      <form onSubmit={handleSubmit(onSubmit)}>
        <Stack spacing={3}>

          <FormControl>
            <InputLabel variant="standard" htmlFor="date"></InputLabel>
            <LocalizationProvider dateAdapter={AdapterDayjs}>
              <DemoContainer components={['DatePicker']}>
                <DatePicker
                  label="日付"
                  {...register("date")}
                  value={value}
                  onChange={(newValue) => setValue(newValue)}
                />
              </DemoContainer>
              <FormHelperText>
              {errors.date && errors.date.message}
            </FormHelperText>
            </LocalizationProvider>
          </FormControl>

          <FormControl>
          </FormControl>

          <FormControl>
            <InputLabel variant="standard" htmlFor="place">
              場所
            </InputLabel>
            <NativeSelect
              defaultValue={0}
              {...register("place")}
            >
              <option value={0}>選択してください</option>
              <option value={1}>東家</option>
              <option value={2}>南家</option>
              <option value={3}>西家</option>
              <option value={4}>北家</option>
            </NativeSelect>
            <FormHelperText>
              {errors.place && errors.place.message}
            </FormHelperText>
          </FormControl>

          <Button type="submit" color="primary" variant="contained">
            送信
          </Button>


        </Stack>
      </form>
    </Container>
  );
}
